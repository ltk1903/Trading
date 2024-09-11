#  include CriterionDefinedByEnum

module CriterionDefinedByEnum
  extend Enumerize

  CRITERION_DEFINED_BY_SYSTEM      = 100
  CRITERION_DEFINED_BY_USER        = 200

  enumerize :defined_by,
            in: {
              system: CRITERION_DEFINED_BY_SYSTEM,
              user:   CRITERION_DEFINED_BY_USER,
            },
            predicates: { prefix: true },
            scope: true,
            default: :system,
            i18n_scope: ['enums.order_criteria.defined_by']
end
