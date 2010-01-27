require 'spec_helper'

describe Challenge do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Challenge.create!(@valid_attributes)
  end
end
