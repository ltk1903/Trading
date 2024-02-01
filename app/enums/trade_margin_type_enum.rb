# include TradeMarginTypeEnum

module TradeMarginTypeEnum
  extend Enumerize

  TRADE_MARGIN_TYPE_X1          = 100
  TRADE_MARGIN_TYPE_X3          = 300
  TRADE_MARGIN_TYPE_X5          = 500
  TRADE_MARGIN_TYPE_X10         = 1000
  TRADE_MARGIN_TYPE_X15         = 1500
  TRADE_MARGIN_TYPE_X20         = 2000
  
  enumerize :margin_type,
            in: {
              x1:     TRADE_MARGIN_TYPE_X1,
              x3:     TRADE_MARGIN_TYPE_X3,
              x5:     TRADE_MARGIN_TYPE_X5,
              x10:    TRADE_MARGIN_TYPE_X10,
              x15:    TRADE_MARGIN_TYPE_X15,
              x20:    TRADE_MARGIN_TYPE_X20,

            },
            predicates: { prefix: true },
            scope: true,
            default: :x1,
            i18n_scope: ['enums.trade.margin_type']
end
