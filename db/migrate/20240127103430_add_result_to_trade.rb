class AddResultToTrade < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :result, :integer
  end
end
