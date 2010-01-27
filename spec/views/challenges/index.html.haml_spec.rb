require 'spec_helper'

describe "/challenges/index.html.haml" do
  include ChallengesHelper

  before(:each) do
    @challenge = mock_model(Challenge, :title => "title",
                           :description => "desc", :lowest_score => 10,
                           :number_of_answers => 5)
    @challenges = [@challenge]
    assigns[:challenges] = @challenges
  end

  it "should display there are no challenges if there are none" do
    @challenges = []
    assigns[:challenges] = []
    render
    response.should have_tag('div', /.*no challenges.*/i)
  end

  it "should not display that there are no challenges if there are challenges" do
    render
    response.should_not have_tag('div', /.*no challenges.*/i)
  end

  it "should have a challenge div" do
    render
    response.should have_tag 'div.challenge'
  end

  it "should have a score div" do
    render
    response.should have_tag 'div.score'
  end

  it "should have an answers div" do
    render
    response.should have_tag 'div.answers'
  end

  it "should have a title div" do
    render
    response.should have_tag 'div.title'
  end

  it "should have a description div" do
    render
    response.should have_tag 'div.description'
  end
end
