require_relative 'reservation_dates'

module HotelBookings
  class Reservation
    def initialize(customer_name:, checkin:, checkout:, room_no:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout
      @room_no = room_no

      @current_reservations = {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    end 

    def rooms
      return current_reservations
    end 
  
    def total_cost
      dates = ReservationDates.new(checkin:@checkin, checkout:@checkout)
      subtotal = dates.total_nights * 200 
      total = subtotal * 1.101
      return total.round(2)
    end 

    def reservation_list(date)
      unavailable_rooms = []
      @current_reservations.each do |room|
        if @current_reservations[room].include?(date) == true 
          unavailable_rooms.push(room)
        end 
      end
      unavailable_rooms = unavailable_rooms.uniq
      return unavailable_rooms
    end
  end 
end 