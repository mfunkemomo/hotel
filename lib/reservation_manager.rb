require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'

module HotelBookings
  class Reservation_Manager
    MAX_ROOMS = 20
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:)
      @customer_name = customer_name

      #pull all rooms with current reservations 
      #array of reservation instances 
      # current_reservations = []
    end 

    def rooms 
      room_list = {}
      rnum = 1
      MAX_ROOMS.times do
        room_list[rnum] = []
        rnum += 1
      end
      return room_list
    end 
  
    def reservation_list(date)
      unavailable_rooms = []
      rooms.each { |room, details| 
        details.each do |dates|
          if dates != date
            if unavailable_rooms.include?(room) == false
              unavailable_rooms.push(room)
            end 
          end 
        end 
        }
      return unavailable_rooms
    end

    def available_rooms_list(date)
      available_rooms = []
      rooms.each { |room, details| 
        details.each do |dates|
          if dates != date
            if available_rooms.include?(room) == false
              available_rooms.push(room)
            end 
          end 
        end 
        }
      return available_rooms
    end

    def reservation_nights(checkin:, checkout:)
      @dates = Reservation_Dates.new(checkin: checkin, checkout:checkout)
      days = []
      day = @dates.checkin
      @dates.total_nights.to_i.times do 
        days.push(day)
        day = day + 1
      end 
      return days 
    end 

    def book_room(checkin:, checkout:)
      booked_rooms = []
      room_num = 1
      num_nights = reservation_nights(checkin:checkin, checkout:checkout)
      num_nights.each do |day|
        unavailable_rooms = reservation_list(day)
        if unavailable_rooms.length == 0 
          booked_rooms.push(room_num)
        else 
          case Room_Number  
          when room_num > 0
            until unavailable_rooms.include?(room_num) == false
              room_num += 1
            end 
            booked_rooms.push(room_num)
          when room_num > MAX_ROOMS
            raise ArgumentError.new("No rooms available for #{day}")
          end  
        end 
      end 
      return booked_rooms 
    end 
    
    def make_reservation(checkin:, checkout:)
      if checkout < checkin
        raise ArgumentError.new('Invalid checkin/checkout date')
      end 

      new_reservation = Reservation.new(customer_name:@customer_name, checkin: checkin, checkout: checkout, room_no: book_room)

      #add reservations to reservation list?
    end 

  end 
end 
