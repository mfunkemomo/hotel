require 'date'

module HotelBookings
  class Reservation_Dates
    attr_reader :checkin, :checkout

    def initialize(checkin:, checkout:)
      @checkin = Date.parse(checkin) 
      @checkout = Date.parse(checkout)
    end 
    
    def total_nights
      number_of_nights = @checkout - @checkin 
      return number_of_nights.to_f
    end 
  end 
end 
