require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'

module HotelBookings
  class Reservation_Manager
    MAX_ROOMS = 20
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:)
      @customer_name = customer_name

      @current_reservations = {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    end 

    def rooms 
      return @current_reservations
    end 
  
    def reservation_list(date)
      unavailable_rooms = []
      rooms[0]..rooms[19].each do |room, dates| 
        dates.each do |res_date|
          if res_date != date
            if unavailable_rooms.include?(room) == false
              unavailable_rooms.push(room)
            end 
          end 
        end 
      end
      return unavailable_rooms
    end

    def available_rooms_list(date)
      available_rooms = []
      rooms[0]..rooms[19].each do |room, dates| 
        dates.each do |res_date|
          if res_dates != date
            if available_rooms.include?(room) == false
              available_rooms.push(room)
            end 
          end 
        end 
      end
      return available_rooms
    end

    def reservation_nights(checkin:, checkout:)
      @dates = Reservation_Dates.new(checkin: checkin, checkout:checkout)
      nights = []
      night = @dates.checkin
      @dates.total_nights.to_i.times do 
        nights.push(night)
        night += 1
      end 
      return nights 
    end 

    def book_room(checkin:, checkout:)
      # booked_rooms = []
      booked_rooms = {}
      room_num = 1
      nights = reservation_nights(checkin:checkin, checkout:checkout)
      nights.each do |night|
        unavailable_rooms = reservation_list(night)
        if unavailable_rooms.length == 0 
          # booked_rooms.push(room_num)
          booked_rooms[room_num] = night
        else 
          case Room_Number  
          when room_num > 0
            until unavailable_rooms.include?(room_num) == false
              room_num += 1
            end 
            # booked_rooms.push(room_num)
            booked_rooms[room_num] = night
          when room_num > MAX_ROOMS
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
      # reserved_nights = reservation_nights(checkin:checkin, checkout:checkout)
      # i= 0
      # reserved_nights.each do |night|
      #   @current_reservations[reserved_rooms[i]] = reserved_nights
      #   i += 1
      # end 

      # preferred way to add reservations to current_reservations
      # undefined method `each' for #<Date: 2019-09-02 ((2458729j,0s,0n),+0s,2299161j)>
      key = 1
      reserved_rooms.length.times do
        dates_array = reserved_rooms[key]
        dates_array.each do |date|
          @current_reservations[key].push(date)
        end 
        key += 1
      end 

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: checkin, checkout: checkout, room_no: reserved_rooms)
      return new_reservation
    end 
  end 
end 
