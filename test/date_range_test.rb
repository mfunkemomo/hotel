
#create tests for date_range file

#ADD TEST FILES AND REQUIRE STATEMENTS

describe "check if date_range is successfully implemented" do 
  before do
    new_res = Date_Range.new('2019-09-01', '2019-09-03')
  end 

  it "create an instance of date_range" do
    expect(new_res).must_be_instance_of Date_Range
  end 

  it "make checkin and check out as Date classes" do 
    expect(new_res.checkin).must_equal Date
    expect(new_res.checkout).must_equal Date
  end 

  it "check if total nights calculates correctly and as an integer" do 
    expect(number_of_nights).must_equal 2
    expect(number_of_nights).must_equal Integer 
  end 

end 