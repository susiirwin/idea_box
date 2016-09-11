require 'rails_helper'

RSpec.feature "Logged In User Can Create An Idea" do
  scenario "loged in user can create a new idea" do

    user = create_user
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_idea_path
    save_and_open_page
    click_on "Create Idea"
    fill_in "title", with: "This is a great idea!"
    fill_in "text", with: "I am going to order a large pizza and make it last a whole day!"
    click_on "Make It Happen!"

    expect(page).to have_content("Your idea is awesome. Look what you are going to accomplish:")
  end
end
