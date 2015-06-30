require 'test_helper'

# Test the porttype model
class PorttypeTest < ActiveSupport::TestCase
  test 'can create a valid port type but not a duplicate' do
    assert Porttype.new(
      name: 'test port type',
      connectortype: Connectortype.take
    ).save
    # duplicate
    assert_not Porttype.new(
      name: 'test port type',
      connectortype: Connectortype.take
    ).save
  end
end
