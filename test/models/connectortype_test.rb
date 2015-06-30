require 'test_helper'

# Test the Connectortype model
class ConnectortypeTest < ActiveSupport::TestCase
  test 'can save a valid Connectortype but not a duplicate' do
    assert Connectortype.new(
      name: 'Test connection type'
    ).save

    assert_not Connectortype.new(
      name: 'Test connection type'
    ).save
  end
end
