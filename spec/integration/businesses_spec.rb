require 'swagger_helper'

describe "Businesses API" do
  path '/businesses' do
    post 'Creates a new business' do
      consumes 'application/json'
      parameter name: :business, in: :body, schema: {
          type: :object,
          properties: {
              name: {type: :string},
              logo: {type: :string},
              description: {type: :string},
              main_address: {type: :string},
              phone: {type: :string}
          },
          required: ['name', 'main_address']
      }

      response '201', 'business created' do
        let(:business) {{name: 'foo', 'main_address': 'bar'}}
        run_test!
      end

      response '422', 'invalid request' do
        let(:business) {{logo: 'foo.jpg'}}
        run_test!
      end
    end
  end
end