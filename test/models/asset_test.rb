require 'test_helper'

# Test the asset model
class AssetTest < ActiveSupport::TestCase
  test 'should not save without serial' do
    asset = Asset.new
    assert_not asset.save, 'Saved an asset without a serial'
  end

  test 'should save but not with a duplicate serial' do
    asset = Asset.new(serial: 'testserial')
    assert asset.save, 'Saved an asset with a valid serial'
    asset = Asset.new(serial: 'testserial')
    assert_not asset.save, 'Saved an asset with a duplicate serial'
  end
end
