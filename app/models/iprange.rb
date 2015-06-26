require 'ipaddr'

# Represents a range of IP addresses like 10.0.0.0/8
class Iprange < ActiveRecord::Base
  before_validation :create_name
  validate :ip_range_is_valid
  validate :parent_must_be_specified_if_exists
  validates :address, presence: true
  validates :prefix, numericality: true
  belongs_to :parent, class_name: 'Iprange'
  has_many :children, class_name: 'Iprange', foreign_key: 'parent_id'
  has_many :ipaddresses

  def create_name
    self.name = "#{address}/#{prefix}"
  end

  # rubocop:disable Lint/HandleExceptions
  def ip_range_is_valid
    IPAddr.new("#{address}/#{prefix}")
      rescue errors.add(:address, "#{address}/#{prefix} is not valid CIDR")
  end
  # rubocop:enable all

  def parent_must_be_specified_if_exists
    # Starting at the smallest ranges work up through looking for a parent
    # if one is found error out unless it is specifed
    Iprange.order('prefix DESC').each do |iprange|
      range = IPAddr.new("#{iprange.address}/#{iprange.prefix}")
      # If the new range is contained within this existing range
      if range.include?(IPAddr.new("#{address}/#{prefix}"))
        # confirm the relationship is declared else error
        if parent_id == iprange.parent_id
          break
        else
          errors.add(:address, "#{address}/#{prefix} is a subset of " \
                               "#{iprange.address}/#{iprange.prefix} " \
                               "but parent is not #{iprange.parent_id}"
                    )
        end
      end
    end
  end
end
