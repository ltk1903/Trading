# == Schema Information
#
# Table name: trades
#
#  id               :bigint           not null, primary key
#  coin_name        :string
#  description      :text
#  entry_photo      :string
#  entry_price      :decimal(, )
#  liquidation      :decimal(, )
#  margin_amount    :decimal(, )
#  margin_type      :integer
#  note             :text
#  result           :integer
#  status           :integer
#  stoploss         :decimal(, )
#  symbol           :string
#  take_profit      :decimal(, )
#  target           :decimal(, )
#  transaction_type :integer
#  volume_amount    :decimal(, )
#  volume_size      :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  time_frame_id    :bigint
#  user_id          :bigint
#
class Trade < ApplicationRecord
  include TradeStatusEnum
  include TradeResultEnum

end
