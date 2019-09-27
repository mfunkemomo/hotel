require 'date'

module HotelBookings
  class ReservationDates
    attr_reader :checkin, :checkout

    def initialize(checkin:, checkout:)
      @checkin = Date.parse(checkin) 
      @checkout = Date.parse(checkout)
    end 

    def date_range
      date_range = @checkin...@checkout
      dates_array = date_range.to_a
      return dates_array
    end 

    def total_nights
      return date_range.length  
    end 
  end 
end 
