class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def sms
    client = Twilio::REST::Client.new
    Rails.logger("GOT A TEXT: #{params.inspect}")
    #RESPOND TO THE MESSAGE
    #client.messages.create(from: '5202545965', to: '3343540566', body: "hello from twilio")
    return head(:created)
  end
end
