require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a full name" do
    user = build(:user, full_name: nil)
    user.valid?
    expect(user.errors[:full_name]).to include("can't be blank")
  end

  it "is invalid if full name has no space" do
    user = build(:user, full_name: "Akpan")
    expect(user).to be_invalid
  end

  it "is valid from factory" do
    user = build(:user)
    expect(user).to be_valid
  end

end