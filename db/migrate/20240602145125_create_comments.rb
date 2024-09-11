class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :photo
      t.integer :status
      t.bigint :relatable_id
      t.string :relatable_type

      t.timestamps
    end
  end
end
