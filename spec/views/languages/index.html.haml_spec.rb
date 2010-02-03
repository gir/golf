require 'spec_helper'

describe "/languages/index.html.haml" do
  include LanguagesHelper

  before(:each) do
    assigns[:languages] = [
      stub_model(Language),
      stub_model(Language)
    ]
  end

  it "renders a list of languages" do
    render
  end
end
