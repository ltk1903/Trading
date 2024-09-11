# include CriterionOrderTypeEnum

module CriterionOrderTypeEnum
  extend Enumerize

  CRITERION_ORDER_TYPE_TRADING       = 100
  CRITERION_ORDER_TYPE_HOLDING       = 200
  CRITERION_ORDER_TYPE_IPO           = 300
  CRITERION_ORDER_TYPE_PRIVATE       = 400

  enumerize :order_type,
            in: {
              trading:          CRITERION_ORDER_TYPE_TRADING,
              holding:          CRITERION_ORDER_TYPE_HOLDING,
              ipo:              CRITERION_ORDER_TYPE_IPO,
              private:          CRITERION_ORDER_TYPE_PRIVATE,
            },
            predicates: { prefix: true },
            scope: true,
            default: :trading,
            i18n_scope: ['enums.order_criteria.order_type']
end
