# Represents a location like a data center or rack, can be nested
class Location < ActiveRecord::Base
  validates :name, uniqueness: true
  validate :parent_can_be_nil_or_present
  belongs_to :contact
  belongs_to :parent, class_name: 'Location'
  has_one :parent, class_name: 'Location', foreign_key: 'parent_id'
  has_many :devices

  def parent_can_be_nil_or_present
    return if parent_id.nil?
    errors.add(:parent, :blank) unless Location.exists?(parent_id)
  end
end
