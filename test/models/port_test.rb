require 'test_helper'

# Test the port model
class PortTest < ActiveSupport::TestCase
  test 'can create a valid unconnected port' do
    assert Port.new(
      name: 'test port',
      porttype: Porttype.all.first,
      device: Device.all.first
    ).save, 'can save a valid port'
  end

  test 'cannot create invalid ports' do
    assert_not Port.new(
      name: 'test port',
      device: Device.all.first
    ).save, 'cannot save with no porttype'

    assert_not Port.new(
      name: 'test port',
      porttype: Porttype.all.first
    ).save, 'cannot save with no device'

    assert_not Port.new(
      porttype: Porttype.all.first,
      device: Device.all.first
    ).save, 'cannot save with no name'
  end
end
