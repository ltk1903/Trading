# == Schema Information
#
# Table name: attachments
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  relatable_type :string
#  resource_type  :integer
#  resource_url   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  relatable_id   :bigint
#
# Indexes
#
#  index_attachments_on_relatable_type_and_relatable_id  (relatable_type,relatable_id)
#
class Attachment < ApplicationRecord

  belongs_to :relatable, polymorphic: true, optional: true
  belongs_to :trade, foreign_key: :relatable_id, optional: true

  mount_uploader :resource_url, AttachemtUploader

  def file_name
    # todo: return file name
    # name.present? ? "#{name}.#{file&.file&.extension}" : file_identifier
  end

  def file_url
    # todo: return URL 
  end




end
