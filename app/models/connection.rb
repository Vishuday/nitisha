# Represents a connection between two ports
class Connection < ActiveRecord::Base
  after_commit :create_inverse, on: [:create, :update]
  after_save :update_inverse, on: [:create, :update]
  validate :connection_is_valid
  after_destroy :destroy_inverse
  validates :cabletype, presence: true
  belongs_to :cabletype

  belongs_to :porta, class_name: 'Port', foreign_key: 'porta_id'
  belongs_to :portb, class_name: 'Port', foreign_key: 'portb_id'

  belongs_to :inverse, class_name: 'Connection', foreign_key: 'inverse_id'

  def connection_is_valid
    if porta == portb
      errors.add(:porta, 'Ports must be different')
      errors.add(:portb, 'Ports must be different')
    end
    errors.add(:porta, :blank) if porta.blank?
    errors.add(:portb, :blank) if portb.blank?
  end

  # Delete the other half of this connection if we are deleting this one
  def destroy_inverse
    Connection.delete(inverse.id)
  end

  # If an inverse needs updating do it here
  # we can do this all in one transaction so its more efficient than create
  # rubocop:disable Metrics/AbcSize
  def update_inverse
    return if inverse.blank? # this is a new connection
    inv = Connection.find(inverse.id)
    return unless inv.porta_id != portb_id || inv.portb_id != porta_id
    inv.porta = portb
    inv.portb = porta
    inv.save
  end
  # rubocop:enable all

  # If an inverse needs creating do it here
  def create_inverse
    # If this is new inverse will be blank
    return unless inverse_id.blank?

    # Create an inverse connection object
    inv = Connection.create(cabletype: cabletype,
                            porta: portb,
                            portb: porta,
                            inverse_id: id)
    inv.save
    # rubocop:disable UselessAssignment
    self.inverse_id = inv.id
    # rubocop:enable all
    save
  end
end
