class HoldsController < ApplicationController
  before_action :set_hold, only: %i[ show edit update destroy ]

  # GET /holds or /holds.json
  def index
    @holds = Hold.all
  end

  # GET /holds/1 or /holds/1.json
  def show
  end

  # GET /holds/new
  def new
    @hold = Hold.new
  end

  # GET /holds/1/edit
  def edit
  end

  # POST /holds or /holds.json
  def create
    @hold = Hold.new(hold_params)

    respond_to do |format|
      if @hold.save
        format.html { redirect_to hold_url(@hold), notice: "Hold was successfully created." }
        format.json { render :show, status: :created, location: @hold }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holds/1 or /holds/1.json
  def update
    respond_to do |format|
      if @hold.update(hold_params)
        format.html { redirect_to hold_url(@hold), notice: "Hold was successfully updated." }
        format.json { render :show, status: :ok, location: @hold }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holds/1 or /holds/1.json
  def destroy
    @hold.destroy

    respond_to do |format|
      format.html { redirect_to holds_url, notice: "Hold was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold
      @hold = Hold.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hold_params
      params.require(:hold).permit(:user_id, :symbol, :coin_name, :target, :volume_size, :volume_amount, :entry_price, :status, :take_profit, :note, :description, :entry_photo)
    end
end
