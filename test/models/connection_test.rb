require 'test_helper'

# Unit tests for Connection model
class ConnectionTest < ActiveSupport::TestCase
  test 'can create/delete a valid connection with an inverse' do

    porta = ports(:swcorep10)
    portb = ports(:swcorep11)

    # Create a new connection
    assert Connection.new(
      porta: porta,
      portb: portb,
      cabletype: Cabletype.take # Any one will do
    ).save, "Can save a new connection"

    # Apparently I can't test the after_commit hook here that does
    # all the inverse creation/update/delete magic
  end

  test 'cannot create a one ended connection' do
    port = ports(:swcorep12)
    assert_not Connection.new(
      porta: port,
      cabletype: Cabletype.take
    ).save
    assert_not Connection.new(
      portb: port,
      cabletype: Cabletype.take
    ).save
  end

  test 'cannot create a connection with no cabletype' do
    porta = ports(:swcorep13)
    portb = ports(:swcorep14)
    assert_not Connection.new(
      porta: porta,
      portb: portb
      ).save
  end

  test 'can update a port on an existing connection' do
    c = connections(:mptocore1)
    portb = ports(:swcorep15)
    c.portb = portb

    # Assert that we can save it
    assert c.save, "Can save updated port"

    # Find the inverse connection and see if the A end of it changed too
    inverse = Connection.find(c.inverse_id)
    assert inverse.porta_id == portb.id
  end
end
