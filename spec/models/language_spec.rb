require 'spec_helper'

describe Language do
  before(:each) do
    @valid_attributes = {
      :name => 'ruby'
    }
  end

  it "should create a new instance given valid attributes" do
    Language.create!(@valid_attributes)
  end

  it "should not be valid without a name" do
    @valid_attributes[:name] = nil
    language = Language.new(@valid_attributes)
    language.should_not be_valid
  end
end
