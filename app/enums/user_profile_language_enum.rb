# include UserProfileLanguageEnum
module UserProfileLanguageEnum
  extend Enumerize

  USER_PROFILE_LANGUAGE_VN      = 100
  USER_PROFILE_LANGUAGE_EN      = 200

  enumerize :language,
            in: {
              vn: USER_PROFILE_LANGUAGE_VN,
              en: USER_PROFILE_LANGUAGE_EN,
            },
            predicates: { prefix: true },
            scope: true,
            default: :vn,
            i18n_scope: ['enums.user_profile.language']
end
