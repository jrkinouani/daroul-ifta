CarrierWave.configure do |config|
     config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        provider: 'AWS',
        :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID_PERSO'],
         :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY_PERSO'],
         :region    =>'us-east-1',
         :host => 's3.amazonaws.com'

      }

      config.fog_directory  = "daroulifta"
      config.fog_public     = false
      config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
    end
