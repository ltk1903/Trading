class TimeFramesController < ApplicationController
  before_action :set_time_frame, only: %i[ show edit update destroy ]

  # GET /time_frames or /time_frames.json
  def index
    @time_frames = TimeFrame.all
  end

  # GET /time_frames/1 or /time_frames/1.json
  def show
  end

  # GET /time_frames/new
  def new
    @time_frame = TimeFrame.new
  end

  # GET /time_frames/1/edit
  def edit
  end

  # POST /time_frames or /time_frames.json
  def create
    @time_frame = TimeFrame.new(time_frame_params)

    respond_to do |format|
      if @time_frame.save
        format.html { redirect_to time_frame_url(@time_frame), notice: "Time frame was successfully created." }
        format.json { render :show, status: :created, location: @time_frame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_frames/1 or /time_frames/1.json
  def update
    respond_to do |format|
      if @time_frame.update(time_frame_params)
        format.html { redirect_to time_frame_url(@time_frame), notice: "Time frame was successfully updated." }
        format.json { render :show, status: :ok, location: @time_frame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_frames/1 or /time_frames/1.json
  def destroy
    @time_frame.destroy

    respond_to do |format|
      format.html { redirect_to time_frames_url, notice: "Time frame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_frame
      @time_frame = TimeFrame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_frame_params
      params.require(:time_frame).permit(:name, :time_code, :description)
    end
end
