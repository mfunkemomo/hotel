require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'
require 'pry'

module HotelBookings
  class Reservation_Manager
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:, checkin:, checkout:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout 
    end 

    def rooms
      room_list ={}
      rnum = 1
      20.times do
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

    def book_room
      @dates = Reservation_Dates.new(checkin:@checkin, checkout:@checkout)
      days = []
      day = @dates.checkin
      @dates.total_nights.to_i.times do 
        days.push(day)
        day = day + 1
      end 

      booked_rooms = []
      i = 0
      days.each do |day|
        unavailable_rooms = reservation_list(day)
        if unavailable_rooms.length == 0 
          available_room = i+1
          rooms[available_room] = day
          booked_rooms.push(available_room)
        elsif unavailable_rooms.length.times  
          if unavailable_rooms.include?(i+1 == false)
            available_room = i+1
            rooms[available_room] = day
            booked_rooms.push(available_room)
          else 
            raise ArgumentError.new("No rooms available for this date: #{day}")
          end 
        end 
      end 
      return booked_rooms 
    end 
    
    def make_reservation
      new_reservation = Reservation.new(customer_name:@customer_name, checkin: @checkin, checkout: @checkout, room_no: book_room)
    end 

  end 
end 
