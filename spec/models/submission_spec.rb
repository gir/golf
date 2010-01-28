require 'spec_helper'

describe Submission do
  before(:each) do
    @user = mock_model(User)
    @challenge = mock_model(Challenge)
    @language = mock_model(Language, :name => 'ruby')
    @valid_attributes = {
      :language => @language,
      :code => "foo",
      :user => @user
    }
  end

  it "should create a new instance given valid attributes" do
    Submission.create!(@valid_attributes)
  end

  it "should not be valid without a language" do
    @valid_attributes[:language] = nil
    submission = Submission.new(@valid_attributes)
    submission.should_not be_valid
  end

  it "should not be valid without code" do
    @valid_attributes[:code] = nil
    submission = Submission.new(@valid_attributes)
    submission.should_not be_valid
  end

  it "should not be valid without a user" do
    @valid_attributes[:user] = nil
    submission = Submission.new(@valid_attributes)
    submission.should_not be_valid
  end

  context "before create" do
    it "should score a submission" do
      submission = Submission.create!(@valid_attributes)
      submission.score.should_not be_blank
    end

    it "should score submission 'foo' as 3" do
      submission = Submission.create!(@valid_attributes)
      submission.score.should == 3
    end

    it "should score submission 'bar!' as 5" do
      @valid_attributes[:code] = "bar!"
      submission = Submission.create!(@valid_attributes)
      submission.score.should == 5
    end

    it "should determine if the submission solves the challenge"
  end
end
