# require_relative 'test_helper'

# describe "Reservation class" do 
#   before do
#     @reservation = HotelBookings::Reservation.new(customer_name: 'Ted', checkin:'2019-09-01', checkout:'2019-09-03', room_no: 18)
#   end 

#   it "creates an instance of Reservation" do
#     expect(@reservation).must_be_kind_of HotelBookings::Reservation
#   end 

#   it "rooms method displays a list(array) of 20 rooms" do 
#     expect(@bookingtest.rooms.keys).must_be_kind_of Array
#     expect(@bookingtest.rooms.length).must_equal 20
#   end

#   it "total_cost method correctly calculates total cost of reservation" do 
#     expect(@reservation.total_cost).must_equal 440.40
#   end 

#   it "total_cost method checks if total_cost rounds 2 decimals" do 
#     expect(@reservation.total_cost).must_be_kind_of Float
#   end 

#   it "reservation_list method display list of reservations/rooms for a given date" do 
#     expect(@bookingtest.reservation_list('2019-09-01')).must_be_kind_of Array
#   end 

#   it "reservation_list method does not have repeated rooms in the reservation list" do
#     temp_list = @bookingtest.reservation_list('2019-09-01')
#     if temp_list == temp_list.uniq
#       verdict = true 
#       return verdict
#     end 
#     expect(verdict).must_equal true 
#   end 
# end 
# end 