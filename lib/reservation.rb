#make Reservation class
require_relative 'lib/date_range'

class Reservation
  def initialize(customer_name, checkin, checkout, room_no)
    @customer_name = customer_name
    @checkin = Date_Range.checkin
    @checkout = Date_Range.checkout
    @room_no = room_no
  end 

  #auto assign a room for reservation
  #DOUBLE CHECK IF THIS IS ACTUALLY DONE IN RESERVATION_MAKER

  #calculate total cost of this reservation
  def total_cost
    subtotal = Date_Range.total_nights * 200 
    total = subtotal * 1.101
    return total
  end 


end 