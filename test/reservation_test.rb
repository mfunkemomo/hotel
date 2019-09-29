require_relative 'test_helper'

describe "Reservation class" do 
  before do
    @reservation = HotelBookings::Reservation.new(customer_name: 'Ted', checkin:'2019-09-01', checkout:'2019-09-03', room_no: 18)
  end 

  it "creates an instance of Reservation" do
    expect(@reservation).must_be_kind_of HotelBookings::Reservation
  end 

  it "total_cost method correctly calculates total cost of reservation" do 
    expect(@reservation.total_cost).must_equal 440.40
  end 

  it "total_cost method checks if total_cost rounds 2 decimals" do 
    expect(@reservation.total_cost).must_be_kind_of Float
  end 
end 