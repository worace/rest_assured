class ShelterAvailability
  def self.check_shelters
    Shelter.all.each { |s| s.update_attribute(:checkin_time, 2.minutes.ago) }
    client = Twilio::REST::Client.new
    Rails.logger.info("****************** CHECKING ON THE CHECKINS ****************")
    Shelter.shelters_needing_checkin.each do |shelter|
      Rails.logger.info("*** CHECKING CHECKINS FOR SHELTER: #{shelter} ***")
      client.messages.create(from: TWILIO_NUMBER, to: HORACE_NUMBER, body: "Automated Check In message from Rest Assured -- Please respond with 'update <number of beds>' to update bed availability for: #{shelter.name}. Or reply with 'options' for more info")
    end
  end
end
