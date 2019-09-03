require 'date'
#create class date_range that intakes check in and check out dates of customer

class Date_Range
  #initialise date range
  def initalize(checkin, checkout)
    @checkin = Date.parse(checkin) 
    @checkout = Date.parse(checkout)
  end 
  #method for how many nights are being requested 
  def total_nights
    #DOUBLE CHECK - can you subtract dates?
    return number_of_nights = checkout - checkin 
  end 
end 