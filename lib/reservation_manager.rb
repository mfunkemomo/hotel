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

    def available_rooms_list(date)
      available_rooms = []
      @current_reservations.each do |room|
        if @current_reservations[room].include?(date) == false 
          available_rooms.push(room)
        end 
      end
      available_rooms = available_rooms.uniq
      return available_rooms
    end

    def book_room
      booked_rooms = {}
      room_num = 1
      nights = @ReservationDates.reservation_nights
      nights.each do |night|
        available_rooms = available_rooms_list(night)
        dates_array = []
        if available_rooms.length == 0 
          dates_array.push(night)
          booked_rooms[room_num] = dates_array
        else 
          if room_num > 0 && room_num <= MAX_ROOMS
            until available_rooms.include?(room_num) == true
              room_num += 1
            end 
            dates_array.push(night)
            booked_rooms[room_num] = dates_array
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
      key = 1
      reserved_rooms.each do |night|
        @current_reservations[key].push(reserved_rooms[key])
        key += 1
      end 

      # tested thsi way but kept running into this error 
      # undefined method `each' for #<Date: 2019-09-02 ((2458729j,0s,0n),+0s,2299161j)>
      # key = 1
      # reserved_rooms.length.times do
      #   dates_array = reserved_rooms[key]
      #   dates_array.each do |date|
      #       if @current_reservations[key].include?(date) == false
      #       @current_reservations[key].push(date)
      #       end 
      #   end 
      #   key += 1
      # end 

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: checkin, checkout: checkout, room_no: reserved_rooms)
      return new_reservation
    end 
  end 
end 
