require 'test_helper'

# Unit tests for devicetype model
class DevicetypeTest < ActiveSupport::TestCase
  test 'Can save a valid devicetype but not a duplicate' do
    assert Devicetype.new(
      name: 'test device type'
    ).save, 'Save a valid device type'
    assert_not Devicetype.new(
      name: 'test device type'
    ).save, 'Save a duplicate device type'
  end

  test 'Cannot save an invalid devicetype with no name' do
    assert_not Devicetype.new.save
  end
end
