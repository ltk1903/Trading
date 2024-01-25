# == Schema Information
#
# Table name: user_profiles
#
#  id          :bigint           not null, primary key
#  address     :string
#  avatar      :string
#  country     :string
#  description :text
#  dob         :datetime
#  gender      :integer
#  level       :integer
#  selfie      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_user_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserProfile < ApplicationRecord
  belongs_to :user

  delegate :id, :name, :alias, :email, :phone, :point, :reference_type, :referral_code, :sign_in_count,
           to: :user,
           prefix: true,
           allow_nil: true
end
