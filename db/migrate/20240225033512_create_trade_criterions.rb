class CreateTradeCriterions < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_criterions do |t|
      t.bigint :trade_id
      t.bigint :criterion_id
      t.boolean :passed

      t.timestamps
    end
  end
end
