# Represents a type of device like server or switch
class Devicetype < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :devices
end
