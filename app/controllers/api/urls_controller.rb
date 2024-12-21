module Api
      class UrlsController < ApplicationController
        before_action :authenticate_token

        def create
          @url = Url.new(url_params)
          if @url.save
            render json: { original_url: @url.original_url, short_url: url_path(@url.short_url) }, status: :created
          else
            render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        private
  
        def url_params
          params.require(:url).permit(:original_url)
        end
  
        def authenticate_token
          token = request.headers['Authorization']
          render json: { error: 'Unauthorized' }, status: :unauthorized unless token == 'your_api_token'
        end
      end
  end
  