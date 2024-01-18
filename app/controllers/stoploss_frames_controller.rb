class StoplossFramesController < ApplicationController
  before_action :set_stoploss_frame, only: %i[ show edit update destroy ]

  # GET /stoploss_frames or /stoploss_frames.json
  def index
    @stoploss_frames = StoplossFrame.all
  end

  # GET /stoploss_frames/1 or /stoploss_frames/1.json
  def show
  end

  # GET /stoploss_frames/new
  def new
    @stoploss_frame = StoplossFrame.new
  end

  # GET /stoploss_frames/1/edit
  def edit
  end

  # POST /stoploss_frames or /stoploss_frames.json
  def create
    @stoploss_frame = StoplossFrame.new(stoploss_frame_params)

    respond_to do |format|
      if @stoploss_frame.save
        format.html { redirect_to stoploss_frame_url(@stoploss_frame), notice: "Stoploss frame was successfully created." }
        format.json { render :show, status: :created, location: @stoploss_frame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stoploss_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stoploss_frames/1 or /stoploss_frames/1.json
  def update
    respond_to do |format|
      if @stoploss_frame.update(stoploss_frame_params)
        format.html { redirect_to stoploss_frame_url(@stoploss_frame), notice: "Stoploss frame was successfully updated." }
        format.json { render :show, status: :ok, location: @stoploss_frame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stoploss_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stoploss_frames/1 or /stoploss_frames/1.json
  def destroy
    @stoploss_frame.destroy

    respond_to do |format|
      format.html { redirect_to stoploss_frames_url, notice: "Stoploss frame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stoploss_frame
      @stoploss_frame = StoplossFrame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stoploss_frame_params
      params.require(:stoploss_frame).permit(:name, :percentage_number, :percentage_max, :percentage_min, :transaction_type, :description)
    end
end
