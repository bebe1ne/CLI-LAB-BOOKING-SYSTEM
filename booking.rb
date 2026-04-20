require 'time'
require_relative 'errors'

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    # Raises a clear error if the action is invalid
    raise BookingError, "Resource '#{resource.name}' is currently unavailable." unless resource.available?

    @user = user
    @resource = resource
    @status = 'active'
    @created_at = Time.now

    # Update the resource to reflect it is now booked
    @resource.assign_booking(self)
  end

  def cancel
    @status = 'cancelled'
    @resource.clear_booking
  end
end