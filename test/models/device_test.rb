require 'test_helper'

# Test the Device model
class DeviceTest < ActiveSupport::TestCase
  test 'can save a valid device but not a duplicate' do
    assert Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      identifier: 'testdevice1',
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a valid device'
    assert_not Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      identifier: 'testdevice1',
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a duplicate device'
  end

  test 'save without a valid name' do
    assert_not Device.new(
      devicetype: Devicetype.all.first,
      identifier: 'testdevice1',
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a device without a name'
  end

  test 'save without a valid device type' do
    assert_not Device.new(
      name: 'test device',
      identifier: 'testdevice1',
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a device without a type'
  end

  test 'save device without an identifier' do
    assert_not Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a valid device'
  end

  test 'save without a valid asset' do
    assert_not Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      location: Location.all.first
    ).save, 'Save a device without an asset'
  end

  test 'save without a valid location' do
    assert_not Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first
    ).save, 'Save a device without a location'
  end
end
