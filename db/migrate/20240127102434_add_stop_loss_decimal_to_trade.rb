class AddStopLossDecimalToTrade < ActiveRecord::Migration[7.0]
  def change
    remove_column :trades, :stoploss, :float
    add_column :trades, :stoploss, :decimal
  end
end
