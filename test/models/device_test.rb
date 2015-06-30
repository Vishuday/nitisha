require 'test_helper'

# Test the Device model
class DeviceTest < ActiveSupport::TestCase
  test 'can save a valid device but not a duplicate' do
    assert Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a valid device'
    assert !Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a duplicate device'
  end

  test 'save without a valid name' do
    assert !Device.new(
      devicetype: Devicetype.all.first,
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a device without a name'
  end

  test 'save without a valid device type' do
    assert !Device.new(
      name: 'test device',
      asset: Asset.all.first,
      location: Location.all.first
    ).save, 'Save a device without a type'
  end

  test 'save without a valid asset' do
    assert !Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first,
      location: Location.all.first
    ).save, 'Save a device without an asset'
  end

  test 'save without a valid location' do
    assert !Device.new(
      name: 'test device',
      devicetype: Devicetype.all.first
    ).save, 'Save a device without a location'
  end
end
