require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'

module HotelBookings
  class Reservation_Manager
    MAX_ROOMS = 20
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:, checkin:, checkout:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout

      #would like to remove this and load all reservation classes instead. Not sure how...
      @current_reservations = {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    end 

    def rooms
      return @current_reservations
    end 

    def rm_availibility_list(date, list_type)
      valid_list_type = %i[available_rooms unavailable_rooms]
      if valid_list_type.include?(list_type) == false
        raise ArgumentError.new "Invalid list type."
      end 

      unavailable_rooms = []
      available_rooms = []
      @current_reservations.each do |room|
        if room.include?(date) == true 
          unavailable_rooms.push(room)
        else 
          available_rooms.push(room)
        end 
      end

      case list_type
      when :unavailable_rooms
        return unavailable_rooms.uniq
      when :available_rooms
        return available_rooms.uniq
      end 
    end 

    def reserve_rooms
      booked_rooms = {}
      new_res = ReservationDates.new(checkin:@checkin, checkout:@checkout)
      new_res.date_range.each do |night|
        nights_booked = []
        available_rooms = rm_availibility_list(night, :available_rooms) 
        if available_rooms.length > 0 && booked_rooms.empty? == true
          nights_booked.push(night)
          booked_rooms[available_rooms.first] = nights_booked
        elsif available_rooms.length > 0 && booked_rooms.empty? == false
          if booked_rooms.include?(available_rooms.first) == true
            booked_rooms[available_rooms.first] = nights_booked.push(night)
          end 
        else 
          raise ArgumentError.new("No rooms available for #{night}")
        end 
      end 
      return booked_rooms 
    end 
    
    def make_reservation
      if @checkout < @checkin
        raise ArgumentError.new('Invalid checkin/checkout date')
      end 

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: @checkin, checkout: @checkout, room_no: reserve_rooms)
      
      return new_reservation
    end 
  end 
end 
