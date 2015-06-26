# Represents the relationship between logical and virtual interfaces
# such as bond0 is made up of eth0 and eth1
class Vifmember < ActiveRecord::Base
  validates :virtualinterface, presence: true
  validates :interface, presence: true
  belongs_to :virtualinterface
  belongs_to :interface
end
