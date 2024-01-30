 # include TradeResultEnum

 module TradeResultEnum
  extend Enumerize

  TRADE_RESULT_CUT_LOSS       = 100
  TRADE_RESULT_STOP_LOSS      = 200
  TRADE_RESULT_TAKE_PROFIT    = 300
  


  enumerize :result,
            in: {
              cutloss:       TRADE_RESULT_CUT_LOSS,
              stoploss:      TRADE_RESULT_STOP_LOSS,
              takeproit:     TRADE_RESULT_TAKE_PROFIT,
              
            },
            predicates: { prefix: true },
            scope: true,
            default: :cutloss,
            i18n_scope: ['enums.trade.result']
end
