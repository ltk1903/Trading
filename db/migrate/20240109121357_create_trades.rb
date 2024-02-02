class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.bigint :user_id
      t.string :symbol
      t.string :coin_name
      t.decimal :target
      t.integer :transaction_type
      t.decimal :volume_size
      t.decimal :volume_amount
      t.decimal :entry_price
      t.decimal :liquidation
      t.decimal :margin_amount
      t.integer :margin_type
      t.integer :status
      t.integer :time_frame
      t.decimal :take_profit
      t.text :note
      t.text :description
      t.string :entry_photo

      t.timestamps
    end
  end
end
