require_relative 'test_helper'

describe "ReservationDates class" do 
  before do
    @dates = HotelBookings::ReservationDates.new(checkin:'2019-09-01', checkout:'2019-09-03')
  end 

  it "creates an instance of ReservationDates" do
    expect(@dates).must_be_kind_of HotelBookings::ReservationDates
  end 

  it "make checkin and check out as Date classes" do 
    expect(@dates.checkin).must_be_kind_of Date
    expect(@dates.checkout).must_be_kind_of Date
  end 

  it "check if total_nights calculates correctly" do 
    expect(@dates.total_nights).must_equal 2
  end 

  it "check if total_nights is an integer" do 
    expect(@dates.total_nights).must_be_kind_of Integer
  end 

  it "date_range returns a list of nights for the date range" do 
    new_res = @dates.date_range
    expect(new_res.length).must_equal 2
    expect(new_res).must_be_kind_of Array
    expect(new_res[1]).must_be_kind_of Date
  end 

end 