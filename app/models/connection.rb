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
    return unless porta == portb
    errors.add(:porta, 'Ports must be different')
    errors.add(:portb, 'Ports must be different')
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
    # If this is new we will have a porta & portb but no inverse
    return unless !porta.blank? && !portb.blank? && inverse.blank?

    # Create an inverse connection object
    inv = Connection.create(cabletype: cabletype,
                            porta: portb,
                            portb: porta,
                            inverse: self)
    # rubocop:disable UselessAssignment
    inverse = inv
    # rubocop:enable all
    save
  end
end
