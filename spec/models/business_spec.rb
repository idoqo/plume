require 'rails_helper'

RSpec.describe Business, type: :model do
  context "Instagram" do
    it "strips @ from handle if present" do
      handle_only = build(:business, instagram: "@nailfactoryy")
      orisirisi = build(:business, instagram: "nai@lfactoryy")

      expect(handle_only.instagram).to eq("nailfactoryy")
      expect(orisirisi.instagram).to eq("nailfactoryy")
    end

    it "strips instagram url from handle if present" do
      sample = build(:business, instagram: "https://instagram.com/@nailfactoryy")
      # pending
    end
  end
end
