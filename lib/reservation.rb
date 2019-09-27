require_relative 'reservation_dates'

module HotelBookings
  class Reservation
    def initialize(customer_name:, checkin:, checkout:, room_no:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout
      @room_no = room_no

      #need to remove this or move it to another class?
      @current_reservations = {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    end 

    #would like to change this to self.all and load all reservations made in running memory. Should return a hash 
    def rooms
      return current_reservations
    end 
  
    def total_cost
      dates = ReservationDates.new(checkin:@checkin, checkout:@checkout)
      subtotal = dates.total_nights * 200 
      total = subtotal * 1.101
      return total.round(2)
    end 

    #change @current_reservation to Reservation.all
    #make a new test for raising argumenterror for invalid list_type
    #not sure if i should have this here, can only use this method if a reservation gets instantiated. what if user  hasnt instantiated but wants to know room availibility? 
    #but it also makes sense to have it here as it will pull all reservations made 
    def rm_availibility_list(date, list_type)
      valid_list_type = %i[available_rooms unavailable_rooms]
      if valid_list_type.include?(list_type) == false
        raise ArgumentError.new "Invalid list type."
      end 

      unavailable_rooms = []
      available_rooms = []
      @current_reservations.each do |room|
        if @current_reservations[room].include?(date) == true 
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
end 