class CreateStoplossFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :stoploss_frames do |t|
      t.string :name
      t.float :percentage_number
      t.float :percentage_max
      t.float :percentage_min
      t.integer :transaction_type
      t.string :description

      t.timestamps
    end
  end
end
