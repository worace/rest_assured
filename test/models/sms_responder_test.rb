#require 'test_helper'
require File.expand_path("../../test_helper", __FILE__)

class SmsResponderTest < ActiveSupport::TestCase
  setup do
    @mockClient = stub("twilioMock", :messages => stub("messages"))

    Shelter.destroy_all
    @shelter1 = Shelter.create(name: "shelter 1", contact_number: "1234561234")
    @shelter1.availability_reports.create(number_of_beds: 12)
    @shelter2 = Shelter.create(name: "shelter 2")
    @shelter2.availability_reports.create(number_of_beds: 2)
  end

  test "sends info about available commands" do
    @mockClient.messages.expects(:create).with(from: TWILIO_NUMBER,
      to: "1231231234",
      body: "Text 'shelters' for current availability listings
      Text 'update <number>' to update availability
      e.g. 'update 6'
      Text 'info' for this info"
    )

    SmsResponder.respond("info", "1231231234", @mockClient)
  end

  test "sends available listings" do
    @mockClient.messages.expects(:create).with(from: TWILIO_NUMBER,
      to: "1231231234",
      body: "beds available:
      shelter 1: 12
      shelter 2: 2".squeeze(' ')
    )

    SmsResponder.respond("shelters", "1231231234", @mockClient)
  end

  test "updates available beds for a shelter" do
    @mockClient.messages.expects(:create).with do |message|
      message[:body].include? "updated your availability to indicate 1"
    end
    SmsResponder.respond("update 1", "1234561234", @mockClient)

    assert_equal 1, @shelter1.beds_available
  end

  test "informs user if their number is not on file" do
    @mockClient.messages.expects(:create).with do |message|
      message[:body].include? "Sorry, your number is not on file for any Rest Assured files"
    end
    SmsResponder.respond("update 1", "5", @mockClient)

    assert_equal 12, @shelter1.beds_available
  end

end
