# Represents a type of port like RJ45
class Porttype < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :connectortype, presence: true
  belongs_to :connectortype
  has_many :ports
end
