require 'swagger_helper'
require 'pp'

describe 'Authentication endpoints' do
  before :each do
    @sample_user = create(:user)
  end

  path '/auth/login' do
    post 'Logs in a user' do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, required: true, schema: {
          '$ref' => '#/definitions/user_login'
      }

      response '200', 'Sign in successful' do
        let(:user) {{ email: @sample_user.email, password: 'topsecret' }}
        run_test!
        # do |response|
        #  PP.pp response.header['Authorization']
        # end
      end

      response '401', "Unauthorized" do
        let(:user) {{ user: {email: 'me@mchl.xyz', password: ''} }}
        run_test!
      end
    end
  end

  path '/auth/signup' do
    post 'Register a new user' do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, required: true, schema: {
          '$ref' => '#/definitions/user'
      }

      response '201', 'User created' do
        let(:user) {{email: @sample_user.email, password: @sample_user.password,
                     full_name: @sample_user.full_name}}
        run_test!
      end

      response '422', 'Fails for invalid email' do
        let(:user) {{email: "mail", password: @sample_user.password,
                     full_name: @sample_user.full_name}}
        run_test!
      end

      response '422', 'Fails when full name contains no space' do
        let(:user) {{email: @sample_user.email, password: @sample_user.password,
                     full_name: "Chukwuma"}}
        run_test!
      end
    end
  end
end