require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new URL' do
      post :create, params: { url: { original_url: 'https://example.com' } }
      expect(response).to have_http_status(:created)
    end

    it 'returns an error for invalid URL' do
      post :create, params: { url: { original_url: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
