class Shelter < ActiveRecord::Base
  CHECKIN_INTERVAL = 10.minutes
  has_many :availability_reports

  def beds_available
    if availability_reports.any?
      availability_reports.last.try(:number_of_beds)
    else
      "No information available"
    end
  end

  def self.shelters_within_last_checkin_interval
    Shelter.where("checkin_time::time >= ? AND checkin_time::time <= ?", CHECKIN_INTERVAL.ago, Time.now)
  end

  def self.shelters_needing_checkin
    shelters_within_last_checkin_interval.select do |shelter|
      shelter.availability_reports.where("created_at >= ?", DateTime.now.beginning_of_day).empty?
    end
  end
end
