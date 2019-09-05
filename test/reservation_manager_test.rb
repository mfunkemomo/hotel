require_relative 'test_helper'

describe "Reservation_Manager class" do 
  before do
    #may need to instantiate reservation_dates to make this work
    @dates = HotelBookings::Reservation_Dates.new(checkin:'2019-09-01', checkout:'2019-09-03')
    @bookingtest = HotelBookings::Reservation_Manager.new(customer_name: 'Ted', checkin:@dates.checkin, checkout:@dates.checkout)
  end 

  it "creates an instance of reservation_manager" do
    expect(@bookingtest).must_be_kind_of HotelBookings::Reservation_Manager
  end 

  # it "displays a list(array) of 20 rooms" do 
  #   expect(@bookingtest.room_list.keys).must_be_kind_of Array
  #   expect(@bookingtest.room_list.length).must_equal 20
  # end 

  # it "correctly calculates total cost of reservation" do 
  #   expect(@reservation.total_cost).must_equal 440.40
  # end 

  # it "checks if total_cost rounds 2 decimals" do 
  #   expect(@reservation.total_cost).must_be_kind_of Float
  # end 

  #need a test to check if room_no is the room id?
end 