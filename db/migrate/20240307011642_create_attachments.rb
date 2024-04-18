class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.bigint :relatable_id
      t.string :relatable_type
      t.string :name
      t.string :resource_url
      t.integer :resource_type
      t.text :description

      t.timestamps
    end

    add_index :attachments, [ :relatable_type, :relatable_id ]
  end
end
