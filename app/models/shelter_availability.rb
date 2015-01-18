class ShelterAvailability
  def self.check_shelters
    client = Twilio::REST::Client.new
    Rails.logger.info("****************** CHECKING ON THE CHECKINS ****************")
    Shelter.shelters_needing_checkin.each do |shelter|
      client.messages.create(from: TWILIO_NUMBER, to: HORACE_NUMBER, body: "hello from twilio")
    end
  end
end
