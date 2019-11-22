require 'swagger_helper'

describe 'Authentication endpoints' do
  path '/auth/login' do
    post 'Logs in a user' do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
              email: {type: :string},
              password: {type: :string}
          },
          required: ['email', 'password']
      }

      response '200', 'Success' do
        run_test!
      end

      response '401', "Unauthorized" do
      end
    end
  end
end