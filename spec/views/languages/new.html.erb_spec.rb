require 'spec_helper'

describe "/languages/new.html.erb" do
  include LanguagesHelper

  before(:each) do
    assigns[:language] = stub_model(Language,
      :new_record? => true
    )
  end

  it "renders new language form" do
    render

    response.should have_tag("form[action=?][method=post]", languages_path) do
    end
  end
end
