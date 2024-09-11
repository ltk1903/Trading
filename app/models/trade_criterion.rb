# == Schema Information
#
# Table name: trade_criterions
#
#  id           :bigint           not null, primary key
#  passed       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  criterion_id :bigint
#  trade_id     :bigint
#
class TradeCriterion < ApplicationRecord
  attr_reader :criterion_title

  belongs_to :trade
  belongs_to :criterion


  delegate :coin_name, :symbol, :entry_price, :margin_amount, :margin_type, :status, :result,
           to: :trade,
           prefix: true,
           allow_nil: true

  delegate :name, :content, :title, :action_type, :order_type, :defined_by, :transaction_type, :rank, :section, :is_required,
           to: :criterion,
           prefix: true,
           allow_nil: true

end
