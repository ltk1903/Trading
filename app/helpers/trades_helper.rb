module TradesHelper
  def criterion_section_color(section)
    return if section.blank?
    return 'text-primary' if section == CriterionSectionEnum::CRITERION_SECTION_TREND
    return 'text-success' if section == CriterionSectionEnum::CRITERION_SECTION_ENTRY
    return 'text-warning' if section == CriterionSectionEnum::CRITERION_SECTION_MENTAL
    return 'text-info'    if section == CriterionSectionEnum::CRITERION_SECTION_MARKET
    'text-secondary'
  end
end
