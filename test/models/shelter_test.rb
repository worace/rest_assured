#require 'test_helper'
require File.expand_path("../../test_helper", __FILE__)

class ShelterTest < ActiveSupport::TestCase
  setup do
    Time.zone = "Mountain Time (US & Canada)"
  end

  test "it finds shelters with checkin time in last 10 minutes" do
    s = Shelter.create(:name => "my shelter", address: "678 Elati St", :checkin_time => 5.minutes.ago)
    assert Shelter.shelters_needing_checkin.include?(s)
    s.update_attribute(:checkin_time, 5.minutes.from_now)
    refute Shelter.shelters_needing_checkin.include?(s)
  end

  test "it finds shelters based on time regardless of date" do
    s = Shelter.create(:name => "my shelter", address: "678 Elati St", :checkin_time => (48.hours.ago - 5.minutes))
    assert Shelter.shelters_needing_checkin.include?(s)
    s.update_attribute(:checkin_time, (48.hours.ago + 5.minutes))
    refute Shelter.shelters_needing_checkin.include?(s)
  end

  test "it does not find a shelter if they have checked in since midnight of previous night" do
    s = Shelter.create(:name => "my shelter", address: "678 Elati St", :checkin_time => 5.minutes.ago)
    assert Shelter.shelters_needing_checkin.include?(s)
    s.availability_reports.create(:number_of_beds => 15)
    refute Shelter.shelters_needing_checkin.include?(s)

    Timecop.travel(24.hours.from_now) do
      assert Shelter.shelters_needing_checkin.include?(s)
    end
  end
end
