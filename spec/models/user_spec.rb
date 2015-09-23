require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: "drew@email.com", password: "password", first_name: "Drew") }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is invalid without an email address" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a name" do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it "cannot be created with a duplicate email address" do
    user_one = User.create(first_name: "Horace", email: "turing@email.com", password: "password")
    user_two = User.create(first_name: "Steve", email: "turing@email.com", password: "password")

    expect(user_one).to be_valid
    expect(user_two).to_not be_valid
  end
end
