
class Utilities
  BASE_URL = Rails.env == 'development' ? "http://#{ENV['DOMAIN']}" : "https://#{ENV['DOMAIN']}"

  def self.special_characters?(str)
    special = "?<>'?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    str =~ regex
  end

  def self.convert_date_to_day_number(date_time)
    return if date_time.blank?
    return unless date_time.kind_of?(DateTime) || date_time.kind_of?(ActiveSupport::TimeWithZone) 
    date_time.to_i * 1000
  end

  def self.convert_number_to_time(d_number)
    return if d_number.blank?

    d_number = d_number.to_i / 1000 if d_number.to_s.length > 10
    Time.at(d_number)
  end

  def self.convert_string_to_number(sting_value)
    sting_value.to_s.gsub(/(,)/, '').to_f
  end

  def self.convert_string_comma_to_float_number(sting_value)
    sting_value.to_s.gsub(/(,)/, '.').to_f
  end

  # sting_value format should be d/m/yy
  def self.convert_string_to_datetime(sting_value)
    sting_value.to_s.to_datetime
  end

  def self.non_vietnamese_accent(str)
    return if str.nil?
    accents = {
      ['á','à','â','ä','ã','ả','ạ','ấ','ầ','ậ','ẩ','ẫ','ă','ặ','ắ','ẳ','ẵ','ằ'] => 'a',
      ['Á','Ã','Ä','Â','À','Ạ','Ả','Ă','Ặ','Ằ','Ắ','Ẳ','Ẵ','Ậ','Ấ','Ầ','Ẩ','Ẫ'] => 'A',
      ['é','è','ẻ','ẽ','ẹ','ê','ë','ế','ể','ễ','ệ','ề'] => 'e',
      ['Ë','É','È','Ê','Ẻ','Ẽ','Ẹ','Ệ','Ế','Ề','Ể','Ễ'] => 'E',
      ['í','ì','î','ï','ị','ỉ','ĩ'] => 'i',
      ['Î','Í','Ì','Ị','Ỉ','Ĩ'] => 'I',
      ['ý','ỳ','ỵ','ỷ','ỹ'] => 'y',
      ['Ý','Ỳ','Ỵ','Ỷ','Ỹ'] => 'Y',
      ['ó','ò','ọ','ỏ','õ','ô','ộ','ố','ồ','ổ','ỗ','ö','õ','ơ','ợ','ớ','ờ','ợ','ở','ỡ'] => 'o',
      ['Ó','Ò','Ọ','Ỏ','Õ','Ô','Ộ','Ố','Ồ','Ổ','Ỗ','Ö','Õ','Ơ','Ợ','Ớ','Ờ','Ợ','Ở','Ỡ'] => 'O',
      ['ú','ù','û','ü','ủ','ũ','ụ','ư','ự','ứ','ừ','ử','ữ'] => 'u',
      ['Ú','Û','Ù','Ü','Ụ','Ủ','Ũ','Ư','Ự','Ứ','Ừ','Ử','Ữ'] => 'U',
      ['ç'] => 'c',
      ['Ç'] => 'C',
      ['ñ'] => 'n',
      ['Ñ'] => 'N',
      ['Đ'] => 'D',
      ['đ'] => 'd'
    }
    accents.each do |ac,rep|
      ac.each do |s|
        str = str.gsub(s, rep)
      end
    end
    str = str.gsub(/[^a-zA-Z0-9\. ]/,"")
    str
  end

  def self.to_bool(str)
    [true, 1, 'TRUE', 'true', 'YES', 'yes', '1'].include?(str)
  end

  def self.valid_url?(url_string)
    url_regexp = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
    url_string =~ url_regexp ? true : false
  end
end
