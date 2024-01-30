 # include UserStatusEnum

 module UserStatusEnum
  extend Enumerize

  USER_STATUS_PENDING       = 0
  USER_STATUS_ACTIVE        = 100
  USER_STATUS_SUSPENDED     = 200
  USER_STATUS_BLOCKED       = 300


  enumerize :status,
            in: {
              pending:    USER_STATUS_PENDING,
              active:     USER_STATUS_ACTIVE,
              suspended:  USER_STATUS_SUSPENDED,
              blocked:    USER_STATUS_BLOCKED,
              
            },
            predicates: { prefix: true },
            scope: true,
            default: :pending,
            i18n_scope: ['enums.user.status']
end
