require 'digest/md5'
class ClientsController < ApplicationController
  REALM = "SuperSecret"
  USERS = {"dhh" => "secret",
           "dap" => Digest::MD5.hexdigest(["dap",REALM,"secret"].join(":"))}
  before_action :authenticate_client
  def index
    @clients = Client.all
    respond_to do |format|
      format.html
      format.json {render json: @clients}
      format.xml {render xml: @clients}
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(student_params)
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def student_params
    params.require(:client).permit(:name, :email, :status)
  end

  def authenticate_client
    authenticate_or_request_with_http_digest(REALM) do |username|
      USERS[username]
      end
  end

end
