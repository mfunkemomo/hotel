require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'

module HotelBookings
  class Reservation_Manager
    MAX_ROOMS = 20
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:)
      @customer_name = customer_name
    end 

    def book_room(checkin:checkin, checkout:checkout)
      booked_rooms = {}
      room_no = 1
      @ReservationDates.date_range.each do |night|
        available_rooms = available_rooms_list(night)
        dates_array = []
        if available_rooms.length == 0 
          dates_array.push(night)
          booked_rooms[room_no] = dates_array
        else 
          if room_no > 0 && room_no <= MAX_ROOMS
            until available_rooms.include?(room_no) == true
              room_no += 1
            end 
            dates_array.push(night)
            booked_rooms[room_no] = dates_array
          else 
            raise ArgumentError.new("No rooms available for #{night}")
          end  
        end 
      end 
      return booked_rooms 
    end 
    
    def make_reservation(checkin:, checkout:)
      if checkout < checkin
        raise ArgumentError.new('Invalid checkin/checkout date')
      end 

      reserved_rooms = book_room(checkin:checkin, checkout:checkout)
      room_no = 1
      reserved_rooms.each do |night|
        @current_reservations[room_no].push(reserved_rooms[room_no])
        room_no += 1
      end 

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: checkin, checkout: checkout, room_no: reserved_rooms)
      return new_reservation
    end 
  end 
end 
