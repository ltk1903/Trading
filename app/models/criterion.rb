# == Schema Information
#
# Table name: criterions
#
#  id               :bigint           not null, primary key
#  action_type      :integer
#  content          :string
#  defined_by       :integer
#  is_required      :boolean
#  name             :string
#  order_type       :integer
#  rank             :integer
#  section          :integer
#  title            :string
#  transaction_type :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#
class Criterion < ApplicationRecord

  include TradeTransactionTypeEnum
  include CriterionOrderTypeEnum
  include CriterionDefinedByEnum
  include CriterionActionTypeEnum
  include CriterionSectionEnum

  translates :title, :content, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  scope :default,     -> { where transaction_type: TRADE_TRANSACTION_TYPE_DEFAULT }
  scope :spot,        -> { where transaction_type: TRADE_TRANSACTION_TYPE_SPOT }
  scope :margin,      -> { where transaction_type: TRADE_TRANSACTION_TYPE_MARGIN }
  scope :future,      -> { where transaction_type: TRADE_TRANSACTION_TYPE_FUTURE }

  scope :default_spot,        -> { where transaction_type: [TRADE_TRANSACTION_TYPE_DEFAULT, TRADE_TRANSACTION_TYPE_SPOT] }
  scope :default_margin,      -> { where transaction_type: [TRADE_TRANSACTION_TYPE_DEFAULT, TRADE_TRANSACTION_TYPE_MARGIN] }
  scope :default_future,      -> { where transaction_type: [TRADE_TRANSACTION_TYPE_DEFAULT, TRADE_TRANSACTION_TYPE_FUTURE] }

end
