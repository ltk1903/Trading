Iconsole.configure do |config|
  admin_iconsole_username = ENV['ADMIN_ICONSOLE_MD5_USERNAME'] || 'admin-iconsole'
  admin_iconsole_password = ENV['ADMIN_ICONSOLE_MD5_PASSWORD'] || 'iconsole'
  
  config.username     = ENV.fetch('ICONSOLE_USERNAME', admin_iconsole_username)
  config.md5_password = ENV.fetch('ICONSOLE_MD5_PASSWORD', Digest::MD5.hexdigest(admin_iconsole_password))
end
