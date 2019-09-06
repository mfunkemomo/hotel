require_relative 'test_helper'

describe "Reservation_Manager class" do 
  before do
    @bookingtest = HotelBookings::Reservation_Manager.new(customer_name: 'Ted', checkin:'2019-09-01', checkout:'2019-09-03')
  end 

  describe "instantiation" do 
    it "creates an instance of reservation_manager" do
      expect(@bookingtest).must_be_kind_of HotelBookings::Reservation_Manager
    end 
  end 

  describe "rooms method" do 
    it "displays a list(array) of 20 rooms" do 
      expect(@bookingtest.rooms.keys).must_be_kind_of Array
      expect(@bookingtest.rooms.length).must_equal 20
    end 
  end 

  describe "reservation_list method" do 
    it "display list of reservations/rooms for a given date" do 
      expect(@bookingtest.reservation_list('2019-09-05')).must_be_kind_of Array
    end 
  
    it "there are no repeated rooms in the reservation list" do
      temp_list = @bookingtest.reservation_list(@checkin)
      i = 0
      comparison = temp_list[i]
      temp_list.each do |room|
        if comparison == room
          expect(test_list).must_equal True
        end  
        i += 1
        expect(test_list).must_equal False
      end 
    end 
  end 
  
  describe "checking room availability, book rooms, and make reservation" do 
    it "find an available room for each night of reservation_dates" do 
      expect(@bookingtest.book_room.length).must_equal 2
    end 

    # it "should raise an error if no rooms are available for a day" do 

    # end 

    it "make_reservation method makes reservation instance" do 
      expect(@bookingtest.make_reservation).must_be_kind_of HotelBookings::Reservation
    end 
  end 
end 