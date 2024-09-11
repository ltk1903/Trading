# include TradeTimeFrameEnum

module TradeTimeFrameEnum
  extend Enumerize

  TRADE_TIME_FRAME_M1     = 1
  TRADE_TIME_FRAME_M5     = 5
  TRADE_TIME_FRAME_M15    = 15
  TRADE_TIME_FRAME_M30    = 30
  TRADE_TIME_FRAME_M45    = 45
  TRADE_TIME_FRAME_M90    = 90
  TRADE_TIME_FRAME_H1     = 100
  TRADE_TIME_FRAME_H2     = 200
  TRADE_TIME_FRAME_H3     = 300
  TRADE_TIME_FRAME_H4     = 400
  TRADE_TIME_FRAME_H5     = 500
  TRADE_TIME_FRAME_H6     = 600
  TRADE_TIME_FRAME_H8     = 800
  TRADE_TIME_FRAME_H10    = 1000
  TRADE_TIME_FRAME_H12    = 1200
  TRADE_TIME_FRAME_D1     = 10_000
  TRADE_TIME_FRAME_D2     = 20_000
  TRADE_TIME_FRAME_D3     = 30_000
  TRADE_TIME_FRAME_D4     = 40_000
  TRADE_TIME_FRAME_D5     = 50_000
  TRADE_TIME_FRAME_D6     = 60_000
  TRADE_TIME_FRAME_W1     = 100_000
  TRADE_TIME_FRAME_W2     = 200_000
  TRADE_TIME_FRAME_W3     = 300_000

  enumerize :time_frame,
            in: {
              m1:       TRADE_TIME_FRAME_M1,
              m5:       TRADE_TIME_FRAME_M5,
              m15:      TRADE_TIME_FRAME_M15,
              m30:      TRADE_TIME_FRAME_M30,
              m45:      TRADE_TIME_FRAME_M45,
              m90:      TRADE_TIME_FRAME_M90,
              h1:       TRADE_TIME_FRAME_H1,
              h2:       TRADE_TIME_FRAME_H2,
              h3:       TRADE_TIME_FRAME_H3,
              h4:       TRADE_TIME_FRAME_H4,
              h5:       TRADE_TIME_FRAME_H5,
              h6:       TRADE_TIME_FRAME_H6,
              h8:       TRADE_TIME_FRAME_H8,
              h10:      TRADE_TIME_FRAME_H10,
              h12:      TRADE_TIME_FRAME_H12,
              d1:       TRADE_TIME_FRAME_D1,
              d2:       TRADE_TIME_FRAME_D2,
              d3:       TRADE_TIME_FRAME_D3,
              d4:       TRADE_TIME_FRAME_D4,
              d5:       TRADE_TIME_FRAME_D5,
              d6:       TRADE_TIME_FRAME_D6,
              w1:       TRADE_TIME_FRAME_W1,
              w2:       TRADE_TIME_FRAME_W2,
              w3:       TRADE_TIME_FRAME_W3,
            },
            predicates: { prefix: true },
            scope: true,
            default: :m1,
            i18n_scope: ['enums.trade.time_frame']
end
