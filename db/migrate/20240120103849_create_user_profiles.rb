class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :country
      t.string :avatar
      t.string :selfie
      t.integer :level
      t.integer :gender

      t.timestamps
    end
  end
end
