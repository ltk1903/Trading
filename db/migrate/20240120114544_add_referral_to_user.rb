class AddReferralToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :referral_code, :string
    add_column :users, :registration_by, :integer
    add_column :users, :reference_type, :integer
    add_column :users, :point, :integer
  end
end
