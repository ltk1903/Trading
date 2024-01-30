# include UserProfileLevelEnum
module UserProfileLevelEnum
  extend Enumerize

  USER_PROFILE_LEVEL_NORMAL     = 0
  USER_PROFILE_LEVEL_VIP1       = 100
  USER_PROFILE_LEVEL_VIP2       = 200



  enumerize :level,
            in: {
              normal: USER_PROFILE_LEVEL_NORMAL,
              vip1: USER_PROFILE_LEVEL_VIP1,
              vip2: USER_PROFILE_LEVEL_VIP2
            },
            predicates: { prefix: true },
            scope: true,
            default: :normal,
            i18n_scope: ['enums.user_profile.level']
end
