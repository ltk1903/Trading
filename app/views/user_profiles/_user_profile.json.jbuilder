json.extract! user_profile, :id, :user_id, :address, :country, :avatar, :selfie, :level, :gender, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
