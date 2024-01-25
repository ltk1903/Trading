# CommonLib.check_photo_extension('test.png')
# CommonLib.read_carrierwave_file(customer.identity_card_front_side)
# CommonLib.base64_to_file(base_64_encoded_data, file_name)

require 'open-uri'
class CommonLib
  def self.check_photo_extension(file_extension)
    return false if file_extension.nil?

    ['png', 'jpeg', 'jpg'].include? file_extension.downcase
  end

  def self.pdf_extension?(file_extension)
    return false if file_extension.nil?
    ['pdf'].include? file_extension.downcase
  end

  def self.convert_carrierwave_file_to_base64(carrierwave_attachment)
    return if carrierwave_attachment.blank?

    attachment_content = read_carrierwave_file(carrierwave_attachment)
    Base64.strict_encode64(attachment_content) unless attachment_content.nil?
  end

  def self.read_carrierwave_file(carrierwave_attachment)
    if Rails.env.to_sym == :development
      file_carrierwave = carrierwave_attachment.file.file
    else
      file_carrierwave = carrierwave_attachment.url
    end

    begin
      URI.open(file_carrierwave,"rb").read
    rescue OpenURI::HTTPError => error
    end
  end

  def self.base64_to_file(base_64_encoded_data, file_name)
    File.open(file_name, 'wb') do |file|
      file.write(Base64.decode64(base_64_encoded_data))
    end
    begin
      URI.open(file_name,"rb")
    rescue OpenURI::HTTPError => error
    end  
  end

end
