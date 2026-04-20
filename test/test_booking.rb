require "minitest/autorun"
require_relative "../user"
require_relative "../resource"
require_relative "../booking"
require_relative "../errors"

class BookingTest < Minitest::Test
  def setup
    @user1 = User.new(id: 1, name: "Mahi", role: "student")
    @user2 = User.new(id: 2, name: "Sarah", role: "student")
    @resource = Resource.new(id: 1, name: "Microscope", category: "lab")
  end


  def test_booking_an_available_resource
    booking = Booking.new(user: @user1, resource: @resource)
    
    assert_equal "active", booking.status
    assert_equal false, @resource.available?
  end


  def test_booking_unavailable_resource_raises_error
    # Create the initial booking
    Booking.new(user: @user1, resource: @resource)


    assert_raises(BookingError) do
      Booking.new(user: @user2, resource: @resource)
    end
  end


  def test_cancelling_booking_changes_status
    booking = Booking.new(user: @user1, resource: @resource)
    booking.cancel
    
    assert_equal "cancelled", booking.status
  end


  def test_cancelling_booking_makes_resource_available
    booking = Booking.new(user: @user1, resource: @resource)
    booking.cancel
    
    assert_equal true, @resource.available?
  end
end