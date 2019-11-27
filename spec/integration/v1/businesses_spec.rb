require 'swagger_helper'
require 'spec_helper'
require 'devise/jwt/test_helpers'

describe "Businesses API" do
  path '/businesses' do
    get 'List all businesses' do
      parameter name: 'page', in: :query, type: 'string'

      let(:page) { 1 }
      response '200', 'success' do
        schema type: 'array', items: {'$ref' => '#/definitions/business'}
      end
    end
  end
end