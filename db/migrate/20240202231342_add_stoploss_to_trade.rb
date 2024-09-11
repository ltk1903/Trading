class AddStoplossToTrade < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :stoploss_price, :decimal
    add_column :trades, :stoloss_percentage, :float
    add_column :trades, :stoploss_amount, :decimal
  end
end
