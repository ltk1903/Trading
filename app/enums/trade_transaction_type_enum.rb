 # include TradeTransactionTypeEnum

module TradeTransactionTypeEnum
  extend Enumerize

  TRADE_TRANSACTION_TYPE_DEFAULT      = 100
  TRADE_TRANSACTION_TYPE_SPOT         = 100
  TRADE_TRANSACTION_TYPE_MARGIN       = 200
  TRADE_TRANSACTION_TYPE_FUTURE       = 300

  enumerize :transaction_type,
            in: {
              default:      TRADE_TRANSACTION_TYPE_DEFAULT,
              spot:         TRADE_TRANSACTION_TYPE_SPOT,
              margin:       TRADE_TRANSACTION_TYPE_MARGIN,
              future:       TRADE_TRANSACTION_TYPE_FUTURE,
            },
            predicates: { prefix: true },
            scope: true,
            default: :spot,
            i18n_scope: ['enums.trade.transaction_type']
end
