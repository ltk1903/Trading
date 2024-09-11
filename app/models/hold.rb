# == Schema Information
#
# Table name: holds
#
#  id            :bigint           not null, primary key
#  user_id       :bigint
#  symbol        :string
#  coin_name     :string
#  target        :decimal(, )
#  volume_size   :decimal(, )
#  volume_amount :decimal(, )
#  entry_price   :decimal(, )
#  status        :integer
#  take_profit   :decimal(, )
#  note          :text
#  description   :text
#  entry_photo   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Hold < ApplicationRecord
end
