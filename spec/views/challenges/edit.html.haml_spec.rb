require 'spec_helper'

describe "/challenges/edit.html.haml" do
  include ChallengesHelper

  before(:each) do
    assigns[:challenge] = @challenge = stub_model(Challenge,
      :new_record? => false
    )
  end

  it "renders the edit challenge form" do
    render

    response.should have_tag("form[action=#{challenge_path(@challenge)}][method=post]") do
    end
  end
end
