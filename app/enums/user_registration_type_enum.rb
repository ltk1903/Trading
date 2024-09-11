# include UserRegistrationTypeEnum
module UserRegistrationTypeEnum
  extend Enumerize

  REGISTRATION_NORMAL           = 100
  REGISTRATION_ADMIN_SUPPORT    = 200

  enumerize :registration_by,
            in: {
              normal: REGISTRATION_NORMAL,
              admin_support: REGISTRATION_ADMIN_SUPPORT
            },
            predicates: { prefix: true },
            scope: true,
            default: :normal,
            i18n_scope: ['enums.user.registration_by']
end
