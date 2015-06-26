# Represents a logical interface like eth0 or Local Area Connection 1
class Interface < ActiveRecord::Base
  validates :name, presence: true
  validates :port, presence: true
  belongs_to :port, inverse_of: :interfaces
  has_many :ipaddresses, inverse_of: :interface
  has_many :vifmembers
  has_many :virtualinterfaces, through: :vifmembers
end
