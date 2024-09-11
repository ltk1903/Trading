json.extract! trade, :id, :user_id, :symbol, :coin_name, :target, :transaction_type, :volume_size, :volume_amount, :entry_price, :liquidation, :margin_amount, :margin_type, :status, :time_frame_id, :stoploss, :take_profit, :note, :description, :entry_photo, :created_at, :updated_at
json.url trade_url(trade, format: :json)
