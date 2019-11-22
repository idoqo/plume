class V1::SessionsController < Devise::SessionsController
  respond_to :json

  wrap_parameters :user, include: [:email, :password]

  private
  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :ok
  end
end