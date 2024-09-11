# include UserProfileGenderEnum
module UserProfileGenderEnum
  extend Enumerize

  USER_PROFILE_GENDER_MR      = 100
  USER_PROFILE_GENDER_MRS     = 200
  USER_PROFILE_GENDER_MS      = 300
  USER_PROFILE_GENDER_MISS    = 400

  enumerize :gender,
            in: {
              mr: USER_PROFILE_GENDER_MR,
              mrs: USER_PROFILE_GENDER_MRS,
              ms: USER_PROFILE_GENDER_MS,
              miss: USER_PROFILE_GENDER_MISS
            },
            predicates: { prefix: true },
            scope: true,
            default: :mr,
            i18n_scope: ['enums.user_profile.gender']
end
