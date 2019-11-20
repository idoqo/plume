class V1::BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  wrap_parameters :business, format: [:json]

  def index
    paginate Business.unscoped, per_page: 1
  end

  def create
    @business = Business.new(businesses_param)
    @business.user = current_user
    if @business.save
      render json: @business, location: @business, status: :created
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  private
  def businesses_param
    params.require(:business).permit(:name, :logo,
                                     :description, :main_address,
                                     :phone, :email, :whatsapp_phone,
                                     :twitter, :instagram)
  end
end