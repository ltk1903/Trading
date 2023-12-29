if Rails.env.test? || ENV['AWS_SECRET_ACCESS_KEY'].nil?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/spec/test_files"
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:                ENV['AWS_REGION'],
      # host:                  's3.example.com',
      # endpoint:              'https://s3.example.com:8080'
    }
    config.fog_directory  = ENV['AWS_S3_BUCKET']
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
    config.storage = :fog
  end
end
