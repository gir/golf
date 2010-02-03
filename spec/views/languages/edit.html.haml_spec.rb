require 'spec_helper'

describe "/languages/edit.html.haml" do
  include LanguagesHelper

  before(:each) do
    assigns[:language] = @language = stub_model(Language,
      :new_record? => false
    )
  end

  it "renders the edit language form" do
    render

    response.should have_tag("form[action=#{language_path(@language)}][method=post]") do
    end
  end
end
