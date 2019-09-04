# require 'date'
require_relative 'reservation_dates'
# require_relative 'reservation_manager'

module HotelBookings
  class Reservation
    def initialize(customer_name:, checkin:, checkout:, room_no:)
      @customer_name = customer_name
      @checkin = checkin
      @checkout = checkout
      @room_no = room_no
    end 
  
    def total_cost
      dates = Reservation_Dates.new(checkin:@checkin, checkout:@checkout)
      subtotal = dates.total_nights * 200 
      total = subtotal * 1.101
      return total.round(2)
    end 
  end 
end 
