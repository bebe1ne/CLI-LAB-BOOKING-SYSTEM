require_relative 'errors'
require_relative 'user'
require_relative 'resource'
require_relative 'booking'

puts "=== CLI Lab Booking System Demo ==="

user1 = User.new(id: 1, name: "Alice", role: "student")
user2 = User.new(id: 2, name: "Bob", role: "assistant")
puts "Created Users: #{user1.name}, #{user2.name}"


resource1 = Resource.new(id: 101, name: "Microscope", category: "lab")
resource2 = Resource.new(id: 102, name: "Projector", category: "electronics")
puts "Created Resources: #{resource1.name}, #{resource2.name}"

puts "\n--- Attempting Valid Booking ---"
booking1 = Booking.new(user: user1, resource: resource1)
puts "Success! #{user1.name} booked #{resource1.name}."
puts "Booking status: #{booking1.status}"
puts "Is #{resource1.name} available? #{resource1.available?}"

puts "\n--- Attempting Conflicting Booking ---"
begin
  booking2 = Booking.new(user: user2, resource: resource1)
rescue BookingError => e
  puts "Conflict Blocked! Error raised: #{e.message}"
end

puts "\n--- Cancelling Booking ---"
booking1.cancel
puts "Booking status changed to: #{booking1.status}"
puts "Is #{resource1.name} available again? #{resource1.available?}"