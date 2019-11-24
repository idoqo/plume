require 'swagger_helper'
require 'pp'

describe 'Authentication endpoints' do
  before :each do
    @sample_user = User.create!(email: 'ck@example.com',
                  full_name: 'Chuk Wu',
                  password: 'topsecret')
  end

  path '/auth/login' do
    post 'Logs in a user' do
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :user, in: :body, required: true, schema: {
          '$ref' => '#/definitions/user'
      }


      response '200', 'Sign in successful' do
        let(:user) {{ email: @sample_user.email, password: 'topsecret' }}
        run_test! do |response|
          PP.pp response.header['Authorization']
        end
      end

      response '401', "Unauthorized" do
        let(:user) {{ user: {email: 'me@mchl.xyz', password: ''} }}
        run_test!
      end
    end
  end
end