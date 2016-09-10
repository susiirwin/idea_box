require 'rails_helper'

RSpec.feature "Existing user can login" do
  scenario "user can go to login screen and login" do
    User.create(name: "Susi", username: "Susi", password: "1234")
    visit login_path

    fill_in "Username", with: "Susi"
    fill_in "Password", with: "1234"
    click_on "Login"

    expect(page).to have_content("Welcome, Susi!")

  end
end
