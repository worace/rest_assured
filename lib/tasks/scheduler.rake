desc "Checks for Shelters that Have not Submitted updated availability information"
task :look_for_checkins => :environment do
  ShelterAvailability.check_shelters
end

