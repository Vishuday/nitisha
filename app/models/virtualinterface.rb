# Represents a virtual interface like bond0 or dummy0 or Team #1
class Virtualinterface < ActiveRecord::Base
  validates :name, presence: true
  has_many :ipaddresses, inverse_of: :virtualinterface
  has_many :vifmembers
  has_many :interfaces, through: :vifmembers
end
