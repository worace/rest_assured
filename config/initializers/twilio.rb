Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_ID']
  config.auth_token = ENV['TWILIO_ACCOUNT_TOKEN']
end
