require 'date'
require_relative 'reservation_dates'
require_relative 'reservation'

module HotelBookings
  class Reservation_Manager
    attr_reader :customer_name, :checkin, :checkout
   
    def initialize(customer_name:, checkin:, checkout:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout 
      # @dates = Reservation_Dates.new(checkin: @checkin, checkout:@checkout)
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
      #NEED TO GO THROUGH RESERVATION INSTANCES 
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
      @dates.total_nights.times do 
        days.push(day)
        day = day + 1
      end 

      days.each do |day|
        check = reservation_list(day)
        i = 0
        for i..check.length
          if rooms[i] != check[i]
            available_room = room[i]
          end 
          new_reservation = Reservation.new(customer_name:@customer_name, checkin: @checkin, checkout: @checkout, room_no: available_room)
        end 
      end 
    end 
  end 
end 
