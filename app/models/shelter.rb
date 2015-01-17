class Shelter < ActiveRecord::Base
  has_many :availability_reports

  def beds_available
    availability_reports.last.number_of_beds
  end
end
