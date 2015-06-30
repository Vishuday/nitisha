require 'test_helper'

# Test the Interface model
class InterfaceTest < ActiveSupport::TestCase
  test 'can save a valid Interface' do
    assert Interface.new(
      name: 'testinterface0',
      port: Port.all.first
    ).save
  end

  test 'cannot save an interface with no name' do
    assert_not Interface.new(
      port: Port.all.first
    ).save
  end

  test 'cannot save an interface with no port' do
    assert_not Interface.new(
      name: 'testinterface0'
    ).save
  end
end
