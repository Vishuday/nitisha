require 'test_helper'

# Test the model for an IPRange
class IprangeTest < ActiveSupport::TestCase
  test 'can create a valid IP range but not a duplicate' do
    # Valid top level range
    r = Iprange.new(
      address: '172.16.0.0',
      prefix: 16,
      parent: nil # parents have their whole own test case further down
    )
    assert r.save, 'Create an IP range with no parent'
    # Duplicate of first range
    assert_not Iprange.new(
      address: '172.16.0.0',
      prefix: 16,
      parent: nil
    ).save, "Cannot create a dupliate range"
  end

  test 'only accepts valid ipv4 or ipv6 ranges' do
    assert Iprange.new(
      address: '172.16.255.0',
      prefix: 32,
      parent: nil
    ).save
    assert_not Iprange.new(
      address: '172.16.256.0',
      prefix: 32,
      parent: nil
    ).save
    assert Iprange.new(
      address: '2001:db9::',
      prefix: 126,
      parent: nil
    ).save
    assert_not Iprange.new(
      address: '2001:dbg::',
      prefix: 126,
      parent: nil
    ).save
  end

  test 'does not allow saving with the wrong parent' do
    # First try with no parent when there should be one
    range = Iprange.new(
      address: '192.168.52.128',
      prefix: 25,
      parent: nil
    )
    assert_not range.save

    # Try now with a parent ID that exists but is wrong
    range.parent_id = 1
    assert_not range.save

    # Try with a parent ID that does not exist at all
    range.parent_id = 1000
    assert_not range.save

    # Try now with the case where the parent is valid but there is a more
    # specific parent (parent should be the smallest containing range)
    range.parent_id = 4
    assert_not range.save

    # Finally with a valid parent
    range.parent_id = 5
    assert range.save
  end
end
