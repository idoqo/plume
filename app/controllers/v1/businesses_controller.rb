class V1::BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  wrap_parameters :business, format: [:json]

  def index
    paginate Business.unscoped, per_page: 10
  end

  def create
    @business = Business.new(businesses_param)
    @business.user = current_user
    if @business.save
      render json: {data: @business}, location: @business, status: :created
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def show
    @export_data = Business.find(params[:id])
    render json: @export_data.to_json(
          include: {user: {except: [:created_at, :updated_at]}
          })
  end

  private
  def businesses_param
    params.require(:business).permit(:name, :logo,
                                     :description, :main_address,
                                     :phone, :email, :whatsapp_phone,
                                     :twitter, :instagram)
  end
end