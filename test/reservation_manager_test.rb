require_relative 'test_helper'

describe "Reservation_Manager class" do 
  before do
    @bookingtest = HotelBookings::Reservation_Manager.new(customer_name: 'Ted', checkin:'2019-09-01', checkout:'2019-09-03')
  end 

  describe "instantiation" do 
    it "creates an instance of reservation_manager" do
      expect(@bookingtest).must_be_kind_of HotelBookings::Reservation_Manager
    end 

    it "raises argument error if checkout/checkin date are invalid" do 
      @bookingtest2 = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-03', checkout:'2019-09-01')
      expect(@bookingtest2).must_raise ArgumentError
      
      # if @bookingtest2.checkout < @bookingtest2.checkin 
      #   expect(@bookingtest2).must_raise ArgumentError
      # end
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

    # it "returns "
  
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

  describe "available_rooms_list method" do 
    it "display list of available rooms for a given date" do 
      expect(@bookingtest.available_rooms_list('2019-09-05')).must_be_kind_of Array
    end 

    # it "returns "
  
    it "there are no repeated rooms in the list" do
      temp_list = @bookingtest.available_rooms_list(@checkin)
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
    it "get a list of dates of the date range" do 
      expect(@bookingtest.reservation_nights.length).must_equal 2
      expect(@bookingtest.reservation_nights).must_be_kind_of Array
    end 

    it "find an available room for each night of reservation_dates" do 
      expect(@bookingtest.book_room.length).must_equal 2
      expect(@bookingtest.book_room).must_be_kind_of Array
    end 

    #THIS IS FOR WAVE 2!!!! 
    # it "should raise an Argument Error if no rooms are available" do 
    #   #make 20 reservations with overlapping date
    #   20.times do 
    #     new_res = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-02', checkout:'2019-09-03')
    #     new_res.make_reservation
    #   end 
    #   expect(@bookingtest.make_reservation).must_raise ArgumentError 
    # end 

    it "make_reservation method makes a reservation (instance)" do 
      expect(@bookingtest.make_reservation).must_be_kind_of HotelBookings::Reservation
    end 
  end 
end 