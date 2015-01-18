class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    number = params["From"][2..-1]
    Rails.logger.info("Handling inbound SMS from #{number} with body: #{params["Body"]}")
    shelter = Shelter.find_by(:contact_number => number)
    if shelter
      num_beds = params["Body"].to_i
      Rails.logger.info("will set number of shelters to #{num_beds} for shelter #{shelter.inspect}")
      shelter.availability_reports.create(:number_of_beds => num_beds)
      client = Twilio::REST::Client.new
      client.messages.create(from: TWILIO_NUMBER, to: number, body: "Thanks! We have updated your availability to indicate #{num_beds} beds available.")
    else
      Rails.logger.info("could not find shelter for contact number: #{number} :( ")
    end
    return head(:created)
  end
end
