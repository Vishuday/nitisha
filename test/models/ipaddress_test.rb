require 'test_helper'

# Unit tests for Ipaddress model
class IpaddressTest < ActiveSupport::TestCase
  test 'can save a valid ipaddress but not a duplicate' do
    assert Ipaddress.new(
      address: '192.168.52.100',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Save a valid IP address record'
    assert_not Ipaddress.new(
      address: '192.168.52.100',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Cannot save a duplicate IP address record'
    assert Ipaddress.new(
      address: '2001:db8::0003',
      parent_id: 6,
      interface: Interface.all.first
    ).save, 'Can save a valid IPv6'
    assert Ipaddress.new(
      address: '192.168.52.101',
      parent_id: 5,
      virtualinterface: Virtualinterface.all.first
    ).save, 'Can save a valid address on a virtual interface'
  end

  test 'cannot save invalid IP addresses' do
    assert_not Ipaddress.new(
      address: '192.168.256.100',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Dont save a invalid IPv4'
    assert_not Ipaddress.new(
      address: '2001:db8::000g',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Dont save a invalid IPv6'
  end

  test 'cannot save an address without a valid parent range' do
    assert_not Ipaddress.new(
      address: '192.168.53.100',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Dont save an ipv4 not within parent range'
    assert_not Ipaddress.new(
      address: '2001:db8::0009',
      parent_id: 5,
      interface: Interface.all.first
    ).save, 'Dont save an ipv6 not within parent range'
  end
end
