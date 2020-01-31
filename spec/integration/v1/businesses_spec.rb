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

  path '/businesses/{id}' do
    get 'Fetch a single business' do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      response '200', 'business found' do
        schema '$ref' => '#/definitions/businesses'
      end

      response '404', 'business not found' do
        run_test!
      end
    end
  end
end