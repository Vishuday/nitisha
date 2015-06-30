require 'test_helper'

# Test the location model
class LocationTest < ActiveSupport::TestCase
  test 'can save a valid Location' do
    l = Location.new(
      name: 'test location',
      parent: nil
    )
    assert l.save
    assert Location.new(
      name: 'test location 2',
      parent_id: l.id
    ).save

    # Duplicate name
    assert_not Location.new(
      name: 'test location',
      parent: nil
    ).save

    # Invalid parent
    assert_not Location.new(
      name: 'test location',
      parent_id: 100
    ).save
  end
end
