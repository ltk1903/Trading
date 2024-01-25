# == Schema Information
#
# Table name: trades
#
#  id               :bigint           not null, primary key
#  user_id          :bigint
#  symbol           :string
#  coin_name        :string
#  target           :decimal(, )
#  transaction_type :integer
#  volume_size      :decimal(, )
#  volume_amount    :decimal(, )
#  entry_price      :decimal(, )
#  liquidation      :decimal(, )
#  margin_amount    :decimal(, )
#  margin_type      :integer
#  status           :integer
#  time_frame_id    :bigint
#  stoploss         :float
#  take_profit      :decimal(, )
#  note             :text
#  description      :text
#  entry_photo      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Trade < ApplicationRecord
end
