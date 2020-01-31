require 'swagger_helper'

describe 'Businesses' do
  path '/businesses' do
    get 'Fetch businesses list' do
      consumes 'application/json'
      produces 'application/json'

      response '200', 'success' do
        run_test!
      end
    end
  end
end