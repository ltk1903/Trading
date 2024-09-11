class AddCurrencyToTrade < ActiveRecord::Migration[7.0]
  def change
    remove_column :trades, :trading_pair, :string
    add_column :trades, :currency, :string
  end
end
