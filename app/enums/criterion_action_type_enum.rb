# include CriterionActionTypeEnum

module CriterionActionTypeEnum
  extend Enumerize

  CRITERION_ACTION_TYPE_CREATE_NEW         = 100
  CRITERION_ACTION_TYPE_CUT_LOSS           = 200
  CRITERION_ACTION_TYPE_TAKE_PROFIT        = 300
  CRITERION_ACTION_TYPE_MOVE_STOPLOSS      = 400

  enumerize :action_type,
            in: {
              create_new:       CRITERION_ACTION_TYPE_CREATE_NEW,
              cut_loss:         CRITERION_ACTION_TYPE_CUT_LOSS,
              take_profit:      CRITERION_ACTION_TYPE_TAKE_PROFIT,
              move_stoploss:    CRITERION_ACTION_TYPE_MOVE_STOPLOSS,
              
            },
            predicates: { prefix: true },
            scope: true,
            default: :create_new,
            i18n_scope: ['enums.order_criteria.action_type']
end
