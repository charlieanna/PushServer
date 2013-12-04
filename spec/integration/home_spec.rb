require 'spec_helper'

describe "There is a home page" do
  it "visits home page" do
    visit '/'
    expect(page).to have_title("developer")
  end
end