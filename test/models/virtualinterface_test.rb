require 'test_helper'

# Unit tests for virtualinterface
class VirtualinterfaceTest < ActiveSupport::TestCase
  test 'can create a virtual interface' do
    assert Virtualinterface.new(
      name: 'test virtual interface'
    ).save
  end

  test 'cannot create a blank virtual interface' do
    assert_not Virtualinterface.new().save
  end
end
