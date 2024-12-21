require 'swagger_helper'

RSpec.describe 'API::Urls', type: :request do
  path '/api/urls' do
    post 'Creates a short URL' do
      tags 'URLs'
      consumes 'application/json'
      parameter name: :url, in: :body, schema: {
        type: :object,
        properties: {
          original_url: { type: :string }
        },
        required: ['original_url']
      }

      response '201', 'URL created' do
        let(:url) { { original_url: 'https://example.com' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:url) { { original_url: '' } }
        run_test!
      end
    end
  end
end
