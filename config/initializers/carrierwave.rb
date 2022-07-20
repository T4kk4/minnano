CarrierWave.configure do |config|
  if Rails.env == 'development'
    config.asset_host = 'http://localhost:3000'
  elsif Rails.env == 'production'
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['ACCESS_KEY_ID'] ,
        aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
        region: 'ap-northeast-1',
    }
    config.fog_directory  = 'buckets.minnano-zeirishi.jp'
    config.asset_host = "https://assets.minnano-zeirishi.jp"
    config.cache_storage = :fog
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.fog_public = true
  end
end
