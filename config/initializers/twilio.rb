Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_ID']
  config.auth_token = ENV['TWILIO_ACCOUNT_TOKEN']
end

TWILIO_NUMBER = '5202545965'
HORACE_NUMBER = '3343540566'
