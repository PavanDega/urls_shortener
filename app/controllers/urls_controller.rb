class UrlsController < ApplicationController
    
    def new
        @url = Url.new
        render :new
    end
  
    def create
      @url = Url.new(url_params)
      if @url.save
        render json: { original_url: @url.original_url, short_url: short_url_path(@url.short_url) }, status: :created
      else
        render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def redirect
      @url = Url.find_by(short_url: params[:short_url])
      if @url
        redirect_to @url.original_url, allow_other_host: true
      else
        render json: { error: 'URL not found' }, status: :not_found
      end
    end
  
    private
  
    def url_params
      params.require(:url).permit(:original_url)
    end
  end
  