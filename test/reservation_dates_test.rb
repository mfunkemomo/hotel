require_relative 'test_helper'

describe "Reservation_Dates class" do 
  before do
    # @passenger = RideShare::Passenger.new(id: 1, name: "Smithy", phone_number: "353-533-5334")
    @dates = HotelBookings::Reservation_Dates.new(checkin:'2019-09-01', checkout:'2019-09-03')
  end 

  it "creates an instance of Reservation_Dates" do
    # expect(@passenger).must_be_kind_of RideShare::Passenger
    expect(@dates).must_be_kind_of HotelBookings::Reservation_Dates
  end 

  # it "make checkin and check out as Date classes" do 
  #   expect(new_res.checkin).must_be_kind_of Date
  #   expect(new_res.checkout).must_be_kind_of Date
  # end 

  # it "check if total nights calculates correctly and as an integer" do 
  #   expect(number_of_nights).must_equal 2
  #   expect(number_of_nights).must_be_kind_of Integer 
  # end 

end 