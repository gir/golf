require 'spec_helper'

describe "/languages/show.html.haml" do
  include LanguagesHelper
  before(:each) do
    assigns[:language] = @language = stub_model(Language)
  end

  it "renders attributes in <p>" do
    render
  end
end
