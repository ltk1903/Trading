class CreateHolds < ActiveRecord::Migration[7.0]
  def change
    create_table :holds do |t|
      t.bigint :user_id
      t.string :symbol
      t.string :coin_name
      t.decimal :target
      t.decimal :volume_size
      t.decimal :volume_amount
      t.decimal :entry_price
      t.integer :status
      t.decimal :take_profit
      t.text :note
      t.text :description
      t.string :entry_photo

      t.timestamps
    end
  end
end
