class SmsResponder

  def self.respond(body, from, client = Twilio::REST::Client.new)
    words = body.split(" ")

    Rails.logger.info("message for words: #{words}")
    puts "message for words :#{words}"
    case words[0].downcase
    when "options"
      send_message(from, options_message, client)
    when "shelters"
      send_message(from, availability_message, client)
    when "update"
      update_availability(from, words[1].to_i, client)
    else
      send_message(from, options_message, client)
    end
  end

  def self.send_message(to, body, client)
    begin
      client.messages.create(from: TWILIO_NUMBER, to: to, body: body)
      true
    rescue Twilio::REST::RequestError => ex
      Rails.logger("Sending message failed: #{ex}")
      false
    end
  end

  def self.availability_message
    "beds available:\n " + Shelter.all.map do |shelter|
      "#{shelter.name}: #{shelter.beds_available}"
    end.join("\n ")
  end

  def self.update_availability(phone, num_beds, client)
    shelter = Shelter.find_by(contact_number: phone)
    if shelter
      shelter.availability_reports.create(:number_of_beds => num_beds)
      send_message(phone, "Thanks! We have updated your availability to indicate #{num_beds} beds available.", client)
    else
      send_message(phone, "Sorry, your number is not on file for any Rest Assured files", client)
    end
  end

  def self.options_message
    "Text 'shelters' for current availability listings
     Text 'update <number>' to update availability (e.g. 'update 6')
     Text 'options' for this info".squeeze(" ")
  end
end