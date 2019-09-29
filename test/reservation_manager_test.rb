require_relative 'test_helper'

describe "Reservation_Manager class" do 
  before do
    @rm_test = HotelBookings::Reservation_Manager.new(customer_name: 'Ted', checkin: '2019-09-01', checkout: '2019-09-03')
  end 

  describe "instantiation" do 
    it "creates an instance of reservation_manager" do
      expect(@rm_test).must_be_kind_of HotelBookings::Reservation_Manager
    end 
  end 

  describe "list of all rooms/current reservations" do 
    it "rooms method displays a list(array) of 20 rooms" do 
      expect(@rm_test.rooms.keys).must_be_kind_of Array
      expect(@rm_test.rooms.length).must_equal 20
    end
  end 

  describe "availbility of rooms list" do 
    it "rm_availability_list returns list of unavailable rooms and available rooms based on symbol parameter for a given date" do 
      ur_list = @rm_test.rm_availibility_list('2019-09-01', :unavailable_rooms)
  
      ar_list = @rm_test.rm_availibility_list('2019-09-01', :available_rooms)
  
      expect(ur_list).must_be_kind_of Array
      expect(ar_list).must_be_kind_of Array
    end 
  
    # it "unavailable and available lists do not have any overlapping rooms" do
  
    # end 
  end 

  describe "reserve_rooms method, holds/bookes room" do 
    it "find an available room for each night of reservation_dates" do
      new_res = @rm_test.reserve_rooms

      expect(new_res.length).must_equal 1
      expect(new_res).must_be_kind_of Hash
      expect(new_res[1]).must_be_kind_of Array
    end 

    # it "should raise an Argument Error if no rooms are available" do 
    #   @new_res = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-01', checkout:'2019-09-02')
    #   20.times do 
    #     @new_res.make_reservation
    #   end 
    #   expect{
    #   @bookingtest.make_reservation
    #   }.must_raise ArgumentError 
    # end 
  end
  
  # describe "make_reservation method, makes the reservation" do 
  #   before do 
  #     new_res = @bookingtest.make_reservation
  #   end 
    
  #   it "make_reservation method makes a reservation (instance)" do 
  #     expect(new_res).must_be_kind_of HotelBookings::Reservation
  #   end 

  #   it "raises argument error if checkout/checkin date are invalid" do
  #     new_rm = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-03', checkout:'2019-09-01')

  #     expect{
  #       new_rm.make_reservation
  #     }.must_raise ArgumentError
  #   end 

  #   it "new reservation is saved in current_reservations" do 
  #     expect{
  #       @current_reservations.has_value?([Date.parse('2019-09-01'), Date.parse('2019-09-02')])
  #     }.must_equal true
  #   end 
  # end 
end 