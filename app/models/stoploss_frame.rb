# == Schema Information
#
# Table name: stoploss_frames
#
#  id                :bigint           not null, primary key
#  name              :string
#  percentage_number :float
#  percentage_max    :float
#  percentage_min    :float
#  transaction_type  :integer
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class StoplossFrame < ApplicationRecord
end
