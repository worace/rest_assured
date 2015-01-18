class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    number = params["From"][2..-1]
    body = params["Body"]
    Rails.logger.info("Handling inbound SMS from #{number} with body: #{params["Body"]}")

    if (SmsResponder.respond(body, number))
      head(:created)
    else
      head(:unprocessable)
    end
  end
end
