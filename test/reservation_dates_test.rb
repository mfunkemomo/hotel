require_relative 'test_helper'

describe "Reservation_Dates class" do 
  before do
    @dates = HotelBookings::Reservation_Dates.new(checkin:'2019-09-01', checkout:'2019-09-03')
  end 

  it "creates an instance of Reservation_Dates" do
    expect(@dates).must_be_kind_of HotelBookings::Reservation_Dates
  end 

  it "make checkin and check out as Date classes" do 
    expect(@dates.checkin).must_be_kind_of Date
    expect(@dates.checkout).must_be_kind_of Date
  end 

  it "check if total_nights calculates correctly" do 
    expect(@dates.total_nights).must_equal 2
  end 

  it "check if total_nights is an integer" do 
    expect(@dates.total_nights).must_be_kind_of Float
  end 

end 