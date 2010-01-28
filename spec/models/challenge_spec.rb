require 'spec_helper'

describe Challenge do
  before(:each) do
    @user = mock_model(User)
    @valid_attributes = {
      :title => 'title',
      :description => 'description',
      :regex => 'regex',
      :example_output => 'output',
      :user => @user
    }
  end

  it "should create a new instance given valid attributes" do
    Challenge.create!(@valid_attributes)
  end

  it "should not be valid without a title" do
    @valid_attributes[:title] = nil
    challenge = Challenge.new(@valid_attributes)
    challenge.should_not be_valid
  end

  it "should not be valid without a description" do
    @valid_attributes[:description] = nil
    challenge = Challenge.new(@valid_attributes)
    challenge.should_not be_valid
  end

  it "should not be valid without a regex" do
    @valid_attributes[:regex] = nil
    challenge = Challenge.new(@valid_attributes)
    challenge.should_not be_valid
  end

  it "should not be valid without example output" do
    @valid_attributes[:example_output] = nil
    challenge = Challenge.new(@valid_attributes)
    challenge.should_not be_valid
  end

  it "should not be valid without a user" do
    @valid_attributes[:user] = nil
    challenge = Challenge.new(@valid_attributes)
    challenge.should_not be_valid
  end
end
