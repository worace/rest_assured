# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Scrub reports and set checkin time to allow demo of checkin feature"
task :demo_setup => :environment do
  s = Shelter.find_by(:contact_number => HORACE_NUMBER)
  s.availability_reports.destroy_all
  s.update_attribute(:checkin_time, 2.minutes.ago)
end
