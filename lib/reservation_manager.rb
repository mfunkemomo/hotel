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

    #auto assigns a rooom number when making a reservation instance

    #room status (availability) for a certain day 
    def room_status(date)
      #go through room_list
      #for each room, look for the date 
      #check if the status for that date 
    end 
  
    #list of current reservations for a certain day
    def reservation_list(date)
      #for each reservation instance, check for the given date
      #if the date
      #return list of reservations
      
    end
    
    #book a room 
    def book_room
      # find the first room that is available 
      # if room in room list is available make room_no equal that room
      # available_room = room_list.find{|room| room.status == :available}
      # room_no = available_room.room_no

      # # make a reservation instance
      new_reservation = Reservation.new(customer_name:@customer_name, checkin: @checkin, checkout: @checkout, room_no)
      # #add reservation instance to reservation list - WHERE IS RESERVATION LIST
      # reservation_list.push(new_reservation)
    end 
  end 
end 
