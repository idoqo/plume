require 'swagger_helper'

describe "Businesses API" do
  before :each do |test|
    if test.metadata[:user_required]
      sample_user = User.create!(email: 'ck@example.com',
                                 full_name: 'Chuk Wu',
                                 password: 'topsecret')
    end
  end

  path '/businesses' do
    get 'List all businesses' do
      parameter name: 'page', in: :query, type: 'string'

      let(:page) { 1 }
      response '200', 'success' do
        schema type: 'array', items: {'$ref' => '#/definitions/business'}
      end
    end

    post 'Creates a new business' do
      consumes 'application/json'
      security [ bearerAuth: [] ]
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

      response '201', 'business created', user_required: true do
        before do

        end
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