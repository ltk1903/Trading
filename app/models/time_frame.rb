# == Schema Information
#
# Table name: time_frames
#
#  id          :bigint           not null, primary key
#  name        :string
#  time_code   :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TimeFrame < ApplicationRecord
end
