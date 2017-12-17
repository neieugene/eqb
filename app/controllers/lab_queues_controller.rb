class LabQueuesController < ApplicationController
  before_action :set_lab_queue, only: [:show, :edit, :update, :destroy]

  # GET /lab_queues
  # GET /lab_queues.json
  def index
    @lab_queues = LabQueue.all
  end

  # GET /lab_queues/1
  # GET /lab_queues/1.json
  def show
  end

  # GET /lab_queues/new
  def new
    @lab_queue = LabQueue.new
  end

  # GET /lab_queues/1/edit
  def edit
  end

  # POST /lab_queues
  # POST /lab_queues.json
  def create
    @lab_queue = LabQueue.new(lab_queue_params)

    respond_to do |format|
      if @lab_queue.save
        format.html { redirect_to @lab_queue, notice: 'Lab queue was successfully created.' }
        format.json { render :show, status: :created, location: @lab_queue }
      else
        format.html { render :new }
        format.json { render json: @lab_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_queues/1
  # PATCH/PUT /lab_queues/1.json
  def update
    if (session[:current_user_vkid] == 140285287)
      respond_to do |format|
        if @lab_queue.update(lab_queue_params)
          format.html { redirect_to @lab_queue, notice: 'Lab queue was successfully updated.' }
          format.json { render :show, status: :ok, location: @lab_queue }
        else
          format.html { render :edit }
          format.json { render json: @lab_queue.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /lab_queues/1
  # DELETE /lab_queues/1.json
  def destroy
    if (session[:current_user_vkid] == 140285287)
      @lab_queue.destroy
      respond_to do |format|
        format.html { redirect_to lab_queues_url, notice: 'Lab queue was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_queue
      @lab_queue = LabQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_queue_params
      params.require(:lab_queue).permit(:name, :date)
    end
end
