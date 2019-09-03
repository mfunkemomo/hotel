require_relative 'date_range'

class Reservation_Manager
  #takes in all attributes of Reservation class 
  #initialize 
  def initialize()
    #array of room instances
    room_list =[]
    #create a list of 20 room instances 
    rn = 1
    20.times do
      room = Room.new(rn, 200, :available)
      room_list.push(room)
      rn += 1
    end 
  end 

  #methods
  #room status (availability) for a certain day 
  def room_status(date)

  end 

  #list of current reservations for a certain day
  def reservation_list(date)
    
  end
  
  #book a room 
  def book_room
    #make a reservation instance
    #find the first room that is available 
    #if room in room list is available make room_no equal that room
    available_room = room_list.find{|room| room.status == :available}
    room_no = available_room.room_no
    #does checkin and checkout have to be Date_Range.checkin/out
    new_reservation = Reservation.new(customer_name, checkin, checkout, room_no)
    #add reservation instance to reservation list - WHERE IS RESERVATION LIST
    reservation_list.push(new_reservation)
  end 
end 