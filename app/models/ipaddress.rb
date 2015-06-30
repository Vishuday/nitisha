require 'resolv'

# Represents a single IP address
class Ipaddress < ActiveRecord::Base
  validates :parent, presence: true
  validates :address, presence: true,
                      uniqueness: true
  validate :ipv4_or_ipv6_valid
  validate :ip_within_parent
  validate :ip_within_range
  validate :interface_or_virtualinterface
  belongs_to :parent, class_name: 'Iprange'
  belongs_to :interface, inverse_of: :ipaddresses
  belongs_to :virtualinterface, inverse_of: :ipaddresses

  # rubocop:disable Metrics/MethodLength
  # must provide either a physical or a virtual interface not both
  def interface_or_virtualinterface
    if !interface.blank? && !virtualinterface.blank?
      errors.add(:base, 'Only specify Interface or Virtualinterface')
    elsif interface.blank? && virtualinterface.blank?
      errors.add(:base, 'Specify either Interface or VirtualInterface')
    end
    if !interface.nil?
      errors.add(:interface, :invalid) unless Interface.exists?(interface.id)
    elsif !virtualinterface.nil?
      errors.add(:virtualinterface,
                 :invalid) unless Virtualinterface.exists?(virtualinterface.id)
    end
  end
  # rubocop:enable all

  def ipv4_or_ipv6_valid
    case address
    when Resolv::IPv4::Regex
      return
    when Resolv::IPv6::Regex
      return
    else
      errors.add(:address, :invalid)
    end
  end

  def ip_within_parent
    begin
      parent = Iprange.find(parent_id)
      errors.add(:address, 'Is not within parent range') unless
        IPAddr.new("#{parent.address}/#{parent.prefix}").include? address
    rescue ActiveRecord::RecordNotFound
      errors.add(:address, 'Parent specified does not exist')
    rescue IPAddr::InvalidAddressError
      return # This is handled elsewhere
    end
  end

  def ip_within_range
    # Get all the ranges starting at smallest and working up
    begin
      Iprange.order('prefix DESC').each do |iprange|
        range = IPAddr.new("#{iprange.address}/#{iprange.prefix}")
        if range.include?(IPAddr.new(address))
          if parent_id == iprange.id
            return nil
          else
            errors.add(:address, "#{address} falls within " \
                                 "#{iprange.address}/#{iprange.prefix} " \
                                 "but parent is not #{iprange.id}")
          end
        end
      end
    rescue IPAddr::InvalidAddressError # This is handled by ipv4_or_ipv6_valid
      return                           # but needs to be caught here too
    end
    # If we haven't found a matching parent range by this point then one
    # does not exist
    errors.add(:address, "Address #{address} does not fall within any range")
  end
end
