# Represents an instance of a type of device like a DL380 of type server
class Device < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :devicetype, presence: true
  validates :asset, presence: true
  validates :location, presence: true
  belongs_to :devicetype
  belongs_to :asset
  belongs_to :location
  has_many :ports, inverse_of: :device
end
