class TradesController < ApplicationController
  before_action :set_trade, only: %i[ show edit update destroy ]
  before_action :load_resource, only: %i[ new show edit update ]
  before_action :authenticate_user!

  # GET /trades or /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1 or /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new(
        transaction_type:     TradeTransactionTypeEnum::TRADE_TRANSACTION_TYPE_SPOT,
        margin_type:          TradeMarginTypeEnum::TRADE_MARGIN_TYPE_X1,
        time_frame:           TradeTimeFrameEnum::TRADE_TIME_FRAME_D1,
        stoloss_percentage:   1.0,
        symbol:               'BTC',
        coin_name:            'Bitcon',
      )


    @trade.attachments.build
    # @trade.attachments.build(criterion_id: criterion.id, passed: false)
    # @criterions = Criterion.default_spot.order(section: 'ASC')
    @criterions.each do |criterion|
      @trade.trade_criterions.build(criterion_id: criterion.id, passed: false)
    end
    # @criterions = Criterion.default_margin if params[:transaction_type] == TradeTransactionTypeEnum::TRADE_TRANSACTION_TYPE_MARGIN
    # @criterions = Criterion.default_future if params[:transaction_type] == TradeTransactionTypeEnum::TRADE_TRANSACTION_TYPE_FUTURE

  end

  # GET /trades/1/edit
  def edit
    # @criterions = Criterion.default_spot.order(section: 'ASC')
  end

  # POST /trades or /trades.json
  def create
    @trade = Trade.new(trade_params)

    byebug
    # check params
    respond_to do |format|
      if @trade.save
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully created." }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1 or /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to trade_url(@trade), notice: "Trade was successfully updated." }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1 or /trades/1.json
  def destroy
    @trade.destroy

    respond_to do |format|
      format.html { redirect_to trades_url, notice: "Trade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def load_resource
      @criterions = Criterion.default_spot.order(section: 'ASC')
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(
        :user_id,
        :coin_name,
        :currency,
        :description,
        :entry_photo,
        :entry_price,
        :liquidation,
        :margin_amount,
        :margin_type,
        :note,
        :result,
        :status,
        :stoloss_percentage,
        :stoploss_amount,
        :stoploss_price,
        :symbol,
        :take_profit,
        :target,
        :time_frame,
        :transaction_type,
        :volume_amount,
        :volume_size,
        attachments_attributes: attachments_attributes,
        trade_criterions_attributes: trade_criterions_attributes
      )
    end

    def attachments_attributes
      %i[_destroy id description name relatable_type resource_type resource_url relatable_id]
    end


    def trade_criterions_attributes
      %i[_destroy id passed criterion_id trade_id]
    end

end
