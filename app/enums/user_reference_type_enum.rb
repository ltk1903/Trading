# include UserReferenceTypeEnum
module UserReferenceTypeEnum
  extend Enumerize

  REFERRAL_UNKNOWN            = 0
  REFERRAL_USER_GOOGLE        = 100
  REFERRAL_FRIEND             = 300
  REFERRAL_USER_REFERRAL      = 400
  REFERRAL_USER_OTHER         = 500


  enumerize :reference_type,
            in: {
              unknown: REFERRAL_UNKNOWN,
              google: REFERRAL_USER_GOOGLE,
              from_friend: REFERRAL_FRIEND,
              user_referral: REFERRAL_USER_REFERRAL,
              other: REFERRAL_USER_OTHER,
            },
            predicates: { prefix: true },
            scope: true,
            default: :unknown,
            i18n_scope: ['enums.user.reference_type']
end
