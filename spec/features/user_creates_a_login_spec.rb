require 'rails_helper'

RSpec.feature "User creates a login name and password" do
  scenario "user can create account with valid data" do

  visit new_user_path
  fill_in "user_name", with: "Susi"
  fill_in "user_username", with: "Susi"
  fill_in "user_password", with: "1234"
  fill_in "user_password_confirmation", with: "1234"
  click_on "Create Account"

  expect(page).to have_content("Welcome, Susi!")

  end
end
