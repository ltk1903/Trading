 # include TradeTransactionTypeEnum

module TradeTransactionTypeEnum
  extend Enumerize

  TRADE_TRANSACTION_TYPE_SPOT         = 100
  TRADE_TRANSACTION_TYPE_MARGIN       = 200
  TRADE_TRANSACTION_TYPE_FUTRURE      = 300
  
  


  enumerize :transaction_type,
            in: {
              spot:         TRADE_TRANSACTION_TYPE_SPOT,
              margin:       TRADE_TRANSACTION_TYPE_MARGIN,
              futrure:      TRADE_TRANSACTION_TYPE_FUTRURE,
            },
            predicates: { prefix: true },
            scope: true,
            default: :spot,
            i18n_scope: ['enums.trade.transaction_type']
end
