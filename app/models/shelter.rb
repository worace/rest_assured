class Shelter < ActiveRecord::Base
  has_many :availability_reports
end
