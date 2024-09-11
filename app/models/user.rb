# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  alias                  :string           default(""), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string           default(""), not null
#  phone                  :string           default(""), not null
#  point                  :integer
#  reference_type         :integer
#  referral_code          :string
#  registration_by        :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include UserReferenceTypeEnum
  include UserRegistrationTypeEnum
  include UserStatusEnum

  before_create :user_id_generate
  after_create :create_user_profile

  has_one :user_profile

  accepts_nested_attributes_for :user_profile, allow_destroy: true


  def profile
    user_profile
  end

  def men?
    user_profile.gender_mr?
  end

  def profile_id
    return if user_profile.nil?
    user_profile.id
  end


  private

  def user_id_generate
    self.id = Common::IdentifierService.new.generate(User, 0)
  end

  def create_user_profile
    self.build_user_profile
    self.save
  end

end
