#create room class

class Room 
  def initialize(room_no, room_cost, status:nil)
    @room_no = room_no
    @room_cost = 200
    @status = status || nil 
  end 

  #check status, if nil, set as Available, if not available or unavailable raise error
  def status
    valid_statuses = %i[available unavailable]
    if status == nil
      status = :available
    else valid_statuses.include?(@status) == false
      raise ArgumentError.new "Unknown status"
    end 
  end 
end 