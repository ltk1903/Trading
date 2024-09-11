module UserProfilesHelper
  def avartar_default(user_profile)
    return 'statis/avatar/avatar_men_01.png'    if user_profile.blank?
    return 'statis/avatar/avatar_women.png'     if user_profile.gender_miss?
    return 'statis/avatar/avatar_women_01.png'  if user_profile.gender_ms?
    return 'statis/avatar/avatar_women_02.png'  if user_profile.gender_mrs?

    if user_profile.gender_mr? && Time.now.year - user_profile.created_at.year < 30
      return 'statis/avatar/avatar_men_01.png'
    end
    'statis/avatar/avatar_men_02.png'
  end
end
