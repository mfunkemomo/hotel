require_relative 'test_helper'

describe "Reservation class" do 
  before do
    @reservation = HotelBookings::Reservation.new(customer_name: 'Ted', checkin:'2019-09-01', checkout:'2019-09-03', room_no: 18)
  end 

  it "creates an instance of Reservation" do
    expect(@reservation).must_be_kind_of HotelBookings::Reservation
  end 

  it "rooms method displays a list(array) of 20 rooms" do 
    expect(@reservation.rooms.keys).must_be_kind_of Array
    expect(@reservation.rooms.length).must_equal 20
  end

  it "total_cost method correctly calculates total cost of reservation" do 
    expect(@reservation.total_cost).must_equal 440.40
  end 

  it "total_cost method checks if total_cost rounds 2 decimals" do 
    expect(@reservation.total_cost).must_be_kind_of Float
  end 

  it "rm_availability_list returns list of unavailable rooms and available rooms based on symbol parameter for a given date" do 
    ur_list = @reservation.rm_availibility_list('2019-09-01', :unavailable_rooms)

    ar_list = @reservation.rm_availibility_list('2019-09-01', :available_rooms)

    expect(ur_list).must_be_kind_of Array
    expect(ar_list).must_be_kind_of Array
  end 

  it "unavailable and available lists do not have any overlapping rooms" do

  end 
end 