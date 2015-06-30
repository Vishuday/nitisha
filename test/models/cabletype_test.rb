require 'test_helper'

# Test the Cabletype model
class CabletypeTest < ActiveSupport::TestCase
  test 'can save a valid cabletype but not a duplicate name' do
    conntype = Connectortype.all.first
    assert Cabletype.new(
      name: 'test cable type',
      conn1: conntype,
      conn2: conntype
    ).save
    assert_not Cabletype.new(
      name: 'test cable type',
      conn1: conntype,
      conn2: conntype
    ).save
  end

  test 'can save a cabletype with no name' do
    conntype = Connectortype.all.first
    ct = Cabletype.new(
      conn1: conntype,
      conn2: conntype
    )
    assert_not ct.save
  end

  test 'can save a cabletype with no port type at either end' do
    conntype = Connectortype.all.first
    assert_not Cabletype.new(
      name: 'test cable type1',
      conn1: conntype
    ).save
    assert_not Cabletype.new(
      name: 'test cable type2',
      conn2: conntype
    ).save
  end
end
