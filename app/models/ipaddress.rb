require 'resolv'

# Represents a single IP address
class Ipaddress < ActiveRecord::Base
  validates :parent, presence: true
  validates :address, presence: true,
                      uniqueness: true
  validate :ipv4_or_ipv6_valid
  validate :ip_within_range
  validate :interface_or_virtualinterface
  belongs_to :parent, class_name: 'Iprange'
  belongs_to :interface, inverse_of: :ipaddresses
  belongs_to :virtualinterface, inverse_of: :ipaddresses

  # rubocop:disable Metrics/MethodLength
  # must provide either a physical or a virtual interface not both
  def interface_or_virtualinterface
    if interface.defined? && virtualinterface.defined?
      errors.add(:base, 'Only specify Interface or Virtualinterface')
    elsif interface.blank? && virtualinterface.blank?
      errors.add(:base, 'Specify either Interface or VirtualInterface')
    end
    if interface.defined?
      errors.add(:interface, :invalid) unless Interface.exists?(interface)
    elsif virtualinterface.defined?
      errors.add(:virtualinterface,
                 :invalid) unless VirtualInterface.exists?(virtualinterface)
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

  def ip_within_range
    # Get all the ranges starting at smallest and working up
    Iprange.order('prefix DESC').each do |iprange|
      range = IPAddr.new("#{iprange.address}/#{iprange.prefix}")
      if range.include?(IPAddr.new("#{address}/32"))
        if parent_id == iprange.parent_id
          break
        else
          errors.add(:address, "#{address} falls within " \
                               "#{iprange.address}/#{iprange.prefix} " \
                               "but parent is not #{iprange.parent_id}")
        end
      end
    end
  end
end
