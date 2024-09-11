 # include TradeStatusEnum

 module TradeStatusEnum
  extend Enumerize

  TRADE_STATUS_PLANNING       = 100
  TRADE_STATUS_CANCEL         = 200
  TRADE_STATUS_GOING          = 300
  TRADE_STATUS_DONE           = 400


  enumerize :status,
            in: {
              planning:     TRADE_STATUS_PLANNING,
              cancel:       TRADE_STATUS_CANCEL,
              going:        TRADE_STATUS_GOING,
              done:         TRADE_STATUS_DONE,
            },
            predicates: { prefix: true },
            scope: true,
            default: :planning,
            i18n_scope: ['enums.trade.status']
end
