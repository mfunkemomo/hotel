# require_relative 'test_helper'

# describe "Reservation_Manager class" do 
#   before do
#     @bookingtest = HotelBookings::Reservation_Manager.new(customer_name: 'Ted')
#   end 

#   describe "instantiation" do 
#     it "creates an instance of reservation_manager" do
#       expect(@bookingtest).must_be_kind_of HotelBookings::Reservation_Manager
#     end 
#   end 

#   describe "available_rooms_list method" do 
#     it "display list of available rooms for a given date" do 
#       expect(@bookingtest.available_rooms_list('2019-09-01')).must_be_kind_of Array
#     end 
  
#     it "there are no repeated rooms in available list" do
#       temp_list = @bookingtest.available_rooms_list('2019-09-01')
#       if temp_list == temp_list.uniq
#         verdict = true 
#         return verdict
#       end 
#       expect(verdict).must_equal true 
#     end 
#   end 
  
#   describe "book_room method, check room availability and book room" do 
#     it "find an available room for each night of reservation_dates" do
#       new_res = @bookingtest.book_room(checkin:'2019-09-01', checkout:'2019-09-03') 
#       expect(new_res.length).must_equal 1
#       expect(new_res).must_be_kind_of Hash
#       expect(new_res[1]).must_be_kind_of Array
#     end 

#     it "should raise an Argument Error if no rooms are available" do 
#       @new_res = HotelBookings::Reservation_Manager.new(customer_name: 'Momo')
#       20.times do 
#         @new_res.make_reservation(checkin:'2019-09-01', checkout:'2019-09-02')
#       end 
#       expect{
#       @bookingtest.make_reservation(checkin:'2019-09-01', checkout:'2019-09-03')
#       }.must_raise ArgumentError 
#     end 

#   end
  
#   describe "make_reservation method, makes the reservation" do 
#     before do 
#       @new_res = @bookingtest.make_reservation(checkin:'2019-09-01', checkout:'2019-09-03')
#       @new_res2 = HotelBookings::Reservation_Manager.new(customer_name: 'Momo')
#     end 
    
#     it "make_reservation method makes a reservation (instance)" do 
#       expect(@new_res).must_be_kind_of HotelBookings::Reservation
#     end 

#     it "raises argument error if checkout/checkin date are invalid" do
#       expect{
#         @new_res2.make_reservation(checkin:'2019-09-03', checkout:'2019-09-01')
#       }.must_raise ArgumentError
#     end 

#     it "new reservation is saved in current_reservations" do 
#       expect{
#         @current_reservations.has_value?([Date.parse('2019-09-01'), Date.parse('2019-09-02')])
#       }.must_equal true
#     end 
#   end 
# end 