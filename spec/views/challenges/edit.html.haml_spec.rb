require 'spec_helper'

describe "/challenges/edit.html.haml" do
  include ChallengesHelper

  before(:each) do
    @challenge = mock_model(Challenge, :title => "Challenge", :description => "Description", :regex => "regex", :example_output => "output")
    assigns[:challenge] = @challenge
    template.stub!(:render).with(:partial => "challenges/form",
                                 :locals => { :f => @f })
  end

  it "should render" do
    render
    response.should be_success
  end

=begin
  it "should render the challenges/form partial" do
    template.should_receive(:render).with(:partial => "challenges/form",
                                          :locals => { :f => @f })
    render
  end
=end
end
