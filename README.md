This documentation file includes setup instructions and answers the required optional reflection questions.

Markdown
# CLI Lab Booking System

This is a backend Ruby application that models a lab booking system without utilizing a framework like Rails. It demonstrates fundamental object-oriented programming concepts including data modeling, state management, class interactions, and error handling.

## File Structure
- `app.rb`: The main demonstration script.
- `user.rb`: Contains the `User` class.
- `resource.rb`: Contains the `Resource` class and manages availability state.
- `booking.rb`: Contains the `Booking` class and enforces booking business logic.
- `errors.rb`: Contains the custom `BookingError` exception.
- `test/test_booking.rb`: Contains the Minitest test suite.

## How to Run

1. **Run the demonstration program:**
   ```bash
   ruby app.rb
Run the test suite:

Bash
ruby test/test_booking.rb
Reflection Questions
What part was easiest?
Creating the initial classes (User and Resource) and defining their basic attr_reader properties was the most straightforward part, as it purely involved setting up data containers.

What part was hardest?
Managing the two-way relationship between Booking and Resource required careful thought. Ensuring that when a Booking is initialized, the Resource state actually updates its internal @current_booking variable without causing tight coupling was the primary challenge.

What bug did you face, and how did you fix it?
A potential issue involved forgetting to clear the resource's availability when a booking was canceled. This was fixed by ensuring the cancel method in the Booking class doesn't just change its own @status, but actively calls @resource.clear_booking to reset the resource's state.
