class Shelter < ActiveRecord::Base
  CHECKIN_INTERVAL = 10.minutes
  has_many :availability_reports

  def beds_available
    availability_reports.last.number_of_beds
  end

  def self.shelters_within_last_checkin_interval
    Shelter.where("checkin_time::time >= ? AND checkin_time::time <= ?", CHECKIN_INTERVAL.ago, Time.now)
  end
end
