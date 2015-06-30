# Represents an asset which is generally something that has a serial number
class Asset < ActiveRecord::Base
  validates :serial, uniqueness: true, presence: true
  has_one :device
end
