require_relative 'test_helper'

describe "Reservation_Manager class" do 
  before do
    @bookingtest = HotelBookings::Reservation_Manager.new(customer_name: 'Ted')
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
    before do 

    end 

    it "display list of reservations/rooms for a given date" do 
      expect(@bookingtest.reservation_list('2019-09-05')).must_be_kind_of Array
    end 

    #COME BACK TO THIS 
    # it "successfully pushes unavailable rooms to unavailble_rooms variable" do 
    #   @res_test = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-01', checkout:'2019-09-02')
    #   @res_test.booked_rooms.each do |room_num|
    #     rooms[room_num] = @res_test.reservation_nights
    #   end 
    #   expect{
    #     @res_test.reservation_list(@checkin)
    #   }.must_include @checkin 
    # end 
  
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
  
  describe "book_room method = checking room availability and books room" do 
    it "get a list of dates of the date range" do 
      new_res = @bookingtest.reservation_nights(checkin:'2019-09-01', checkout:'2019-09-03')
      expect(new_res.length).must_equal 2
      expect(new_res).must_be_kind_of Array
    end 

    it "find an available room for each night of reservation_dates" do
      new_res = @bookingtest.book_room(checkin:'2019-09-01', checkout:'2019-09-03') 
      expect(new_res.length).must_equal 2
      expect(new_res).must_be_kind_of Array
    end 

    it "room should be available and not already booked for day" do 

    end 

    it "should raise an Argument Error if no rooms are available" do 
      20.times do 
        @new_res = HotelBookings::Reservation_Manager.new(customer_name: 'Momo', checkin:'2019-09-02', checkout:'2019-09-03')
        @new_res.make_reservation(checkin:'2019-09-01', checkout:'2019-09-03')
      end 
      expect{@bookingtest.make_reservation}.must_raise ArgumentError 
    end 

  end
  
  describe "make_reservation method, makes the reservation" do 
    it "make_reservation method makes a reservation (instance)" do 
      expect{
        @bookingtest.make_reservation(checkin:'2019-09-01', checkout:'2019-09-03')
      }.must_be_kind_of HotelBookings::Reservation
    end 

    it "raises argument error if checkout/checkin date are invalid" do
      expect{
        @new_res = HotelBookings::Reservation_Manager.new(customer_name: 'Momo')
        @new_res.make_reservation(checkin:'2019-09-03', checkout:'2019-09-01')
      }.must_raise ArgumentError
    end 
  end 
end 