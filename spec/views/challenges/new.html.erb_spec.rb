require 'spec_helper'

describe "/challenges/new.html.erb" do
  include ChallengesHelper

  before(:each) do
    assigns[:challenge] = stub_model(Challenge,
      :new_record? => true
    )
  end

  it "renders new challenge form" do
    render

    response.should have_tag("form[action=?][method=post]", challenges_path) do
    end
  end
end
