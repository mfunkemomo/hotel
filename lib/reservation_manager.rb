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

    def reserve_rooms(checkin:checkin, checkout:checkout)
      booked_rooms = {}
      new_res = ReservationDates.new(checkin:checkin, checkout:checkout)
      new_res.date_range.each do |night|
        nights_booked = []
        available_rooms = rm_availability_list(night, :available_rooms) 
        if available_rooms.length > 0 && booked_rooms.empty? == true
          nights_booked.push(night)
          booked_rooms[available_rooms.first] = nights_booked
        elsif available_rooms.length > 0 && booked_rooms.empty? == false
          booked_rooms.include?(available_rooms.first) == true
          booked_rooms[available_rooms.first] = nights_booked.push(night)
        else 
          raise ArgumentError.new("No rooms available for #{night}")
        end 
      end 
      return booked_rooms 
    end 
    
    def make_reservation(checkin:, checkout:)
      if checkout < checkin
        raise ArgumentError.new('Invalid checkin/checkout date')
      end 

      reserved_rooms = reserve_rooms(checkin:checkin, checkout:checkout)

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: checkin, checkout: checkout, room_no: reserved_rooms)
      
      return new_reservation
    end 
  end 
end 
