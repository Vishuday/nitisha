# Represents a physical port into which one might connect a cable
class Port < ActiveRecord::Base
  after_commit :update_remote_connections
  validates :name, presence: true
  validates :porttype, presence: true
  validates :device, presence: true
  belongs_to :porttype
  belongs_to :device, inverse_of: :ports
  has_many :interfaces, inverse_of: :port

  has_one :connecteddevice, through: :connection, source: :portb
  has_one :connection, foreign_key: :porta_id
end
