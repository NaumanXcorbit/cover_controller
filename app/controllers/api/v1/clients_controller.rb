class Api::V1::ClientsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "1122"
  skip_before_action :verify_authenticity_token
  def index
    @clients = Client.includes(:projects).all
    render :'api/v1/clients/index', status: 200
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status:  200
    else
      render json: {error: "Something Went wrong"}
    end
  end

  def show
    @client = Client.find_by(id: params[:id])
    if @client
      render json: @client, :status => 200
    else
      render json: {error: "Client not found"}
    end
  end

  private
  def client_params
    params.require(:client).permit(
    :name, :email, :status, projects_attributes: [:name, :about]
    )
    # params.permit(:name, :email, :status, projects_attributes: [:name, :about])
  end
end
