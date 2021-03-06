class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @lab_queue = LabQueue.find(params[:lab_queue_id])
    if (Ticket.where(client_id: Client.find(session[:current_client_id]).id, lab_queue_id: params[:lab_queue_id]).empty?)
      ticket = Ticket.new(:client_id => Client.find(session[:current_client_id]).id, :lab_queue_id => params[:lab_queue_id], :time => (Time.now + 3 * 60 * 60))
      ticket.save
    end
    redirect_to lab_queue_path(@lab_queue)
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if (session[:current_client_vkid] == 140285287)
      respond_to do |format|
        if @client.update(client_params)
          format.html { redirect_to @client, notice: 'Client was successfully updated.' }
          format.json { render :show, status: :ok, location: @client }
        else
          format.html { render :edit }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    if (session[:current_client_vkid] == 140285287)
      @client.destroy
      respond_to do |format|
        format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :photo, :idvk)
    end
end
