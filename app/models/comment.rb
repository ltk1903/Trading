# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  content        :text
#  photo          :string
#  relatable_type :string
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  relatable_id   :bigint
#
class Comment < ApplicationRecord

  belongs_to :relatable, polymorphic: true, optional: true

  mount_uploader :photo, PhotoUploader
end
