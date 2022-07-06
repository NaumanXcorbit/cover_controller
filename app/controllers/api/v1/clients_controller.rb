class Api::V1::ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @clients = Client.all
    render json: @clients, status: 200
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
    params.permit(:name, :email, :status)
  end
end
