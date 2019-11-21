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
        run_test! do |response|
          data = JSON.parse(response.headers)
          print data
        end
      end
    end
  end
end