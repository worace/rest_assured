# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks



task :look_for_checkins => :environment do
  client = Twilio::REST::Client.new
  Rails.logger.info("****************** CHECKING ON THE CHECKINS ****************")
  client.messages.create(from: '5202545965', to: '3343540566', body: "hello from twilio")
end

