require 'date'

module HotelBookings
  class ReservationDates
    attr_reader :checkin, :checkout

    def initialize(checkin:, checkout:)
      @checkin = Date.parse(checkin) 
      @checkout = Date.parse(checkout)
    end 
    
    def total_nights
      number_of_nights = @checkout - @checkin 
      return number_of_nights.to_f
    end 

    def reservation_nights
      nights = []
      total_nights.each do |night| 
        nights.push(night)
        night += 1
      end 
      return nights 
    end 
  end 
end 
