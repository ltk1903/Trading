class CreateCriterions < ActiveRecord::Migration[7.0]
  def change
    create_table :criterions do |t|
      t.integer :rank
      t.string :name
      t.integer :transaction_type
      t.integer :order_type
      t.integer :action_type
      t.boolean :is_required
      t.integer :defined_by
      t.bigint :user_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Criterion.create_translation_table! :title => :string, :content => :string
      end

      dir.down do
        Criterion.drop_translation_table!
      end
    end
  end
end
