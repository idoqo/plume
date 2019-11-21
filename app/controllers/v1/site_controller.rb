class V1::SiteController < ApplicationController
  def ping
    render json: {message: "alive and kicking!"}, head: :ok
  end
end