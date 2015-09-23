require "rails_helper"

RSpec.describe "Logged in user " do
  let!(:user) { User.create(email: "drew@email.com", password: "password", first_name: "Drew") }

  # context "can add link", js: true do
  #   visit new_user_path
  #   expect(page).to have_content("Create Your Account")
  #   within(".form-group") do
  #     fill_in "first name", with: "Drewby"
  #     fill_in "email", with: "drew#{ (1..1000).sample}@fake.com"
  #     fill_in "password", with: "password"
  #     fill_in "confirm password", with: "password"
  #     click_link_or_button "Create Account"
  #   end
  # end
end
