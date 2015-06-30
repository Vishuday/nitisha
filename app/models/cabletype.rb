# Represents a type of cable like Cat6 or Cat5
class Cabletype < ActiveRecord::Base
  validates :conn1, presence: true
  validates :conn2, presence: true
  validates :name, presence: true, uniqueness: true

  belongs_to :conn1, class_name: 'Connectortype'
  belongs_to :conn2, class_name: 'Connectortype'

  has_many :connections
end
