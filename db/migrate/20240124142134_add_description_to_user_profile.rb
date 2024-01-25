class AddDescriptionToUserProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :description, :text
  end
end
