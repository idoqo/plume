require 'rails_helper'

RSpec.describe V1::SessionsController do
  describe ".login" do
    context "when fields are incomplete" do
      before do
      end

      it "fails for an empty body" do
        # expect(last_response.status).to eq 401
      end

    end

    # it "responds with 401 for absent email" do
    # end
    #
    # it "responds with 401 for absent password" do
    # end
    #
    # it "returns 200 for successful auth" do
    # end
    #
    # it "sends token in header response for successful auth" do
    # end
  end
end