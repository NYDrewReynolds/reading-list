require 'rails_helper'

RSpec.describe Link, type: :model do
  let!(:user) { User.create(email: "drew@email.com", password: "password", first_name: "Drew") }
  let!(:link) { Link.create(url: "http://turing.io/", user_id: user.id) }

  it "is valid" do
    expect(link).to be_valid
  end

  it "is invalid without user_id" do
    link.user_id = nil
    expect(link).to_not be_valid
  end

  it "is invalid without URL" do
    link.url = nil
    expect(link).to_not be_valid
  end

  it "is invalid with bad URL" do
    link.url = "drew"
    expect(link).to_not be_valid
  end

  it "belongs to a user" do
    expect(link.user.id).to eq(user.id)
  end

end
