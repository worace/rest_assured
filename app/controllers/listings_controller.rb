class ListingsController < ApplicationController
  before_action :log_stuff

  def log_stuff
    Rails.logger.error("error hi")
    Rails.logger.info("info hi")
    Rails.logger.debug("debug hi")
  end

  skip_before_action :verify_authenticity_token

  def sms
    number = params["From"][2..-1]
    body = params["Body"]
    Rails.logger.info("Handling inbound SMS from #{number} with body: #{params["Body"]}")

    if (SmsResponder.respond(body, number))
      head(:created)
    else
      Rails.logger.info("inprcoces")
      head(:unprocessable_entity)
    end
  end
end
