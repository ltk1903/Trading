# include CriterionSectionEnum

module CriterionSectionEnum
  extend Enumerize

  CRITERION_SECTION_TREND             = 100
  CRITERION_SECTION_ENTRY             = 200
  CRITERION_SECTION_MENTAL            = 300
  CRITERION_SECTION_MARKET            = 400

  enumerize :section,
            in: {
              trend:            CRITERION_SECTION_TREND,
              entry:            CRITERION_SECTION_ENTRY,
              mental:           CRITERION_SECTION_MENTAL,
              market:           CRITERION_SECTION_MARKET,
              
              
            },
            predicates: { prefix: true },
            scope: true,
            default: :trend,
            i18n_scope: ['enums.criterion.section']
end
