require 'spec_helper'

describe Submission do
  before(:each) do
    @language = mock_model(Language)
    @valid_attributes = {
      :language => @language,
      :code => "foo"
    }
  end

  it "should create a new instance given valid attributes" do
    Submission.create!(@valid_attributes)
  end
end
