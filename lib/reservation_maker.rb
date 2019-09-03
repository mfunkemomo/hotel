#create reservation_maker class

class Reservation_Maker
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
    #add reservation instance to reservation list - WHERE IS RESERVATION LIST
  end 
end 