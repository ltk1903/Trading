# == Schema Information
#
# Table name: trades
#
#  id                 :bigint           not null, primary key
#  coin_name          :string
#  description        :text
#  entry_photo        :string
#  entry_price        :decimal(, )
#  liquidation        :decimal(, )
#  margin_amount      :decimal(, )
#  margin_type        :integer
#  note               :text
#  result             :integer
#  status             :integer
#  stoloss_percentage :float
#  stoploss_amount    :decimal(, )
#  stoploss_price     :decimal(, )
#  symbol             :string
#  take_profit        :decimal(, )
#  target             :decimal(, )
#  time_frame         :integer
#  transaction_type   :integer
#  volume_amount      :decimal(, )
#  volume_size        :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
class Trade < ApplicationRecord
  include TradeStatusEnum
  include TradeResultEnum
  include TradeTransactionTypeEnum
  include TradeMarginTypeEnum
  include TradeTimeFrameEnum

  has_many :trade_criterions


  accepts_nested_attributes_for :trade_criterions, reject_if: :all_blank, allow_destroy: true

end
