# Represents a type of connector like RJ45 or C13
class Connectortype < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :porttypes
  has_many :cabletypes
end
