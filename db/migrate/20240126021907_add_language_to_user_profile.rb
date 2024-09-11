class AddLanguageToUserProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :language, :integer
  end
end
