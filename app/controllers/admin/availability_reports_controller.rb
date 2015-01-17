class Admin::AvailabilityReportsController < Admin::BaseController
  before_action :load_shelter

  def new
    @report = @shelter.availability_reports.new
  end

  def create
    @shelter.availability_reports.create(:number_of_beds => params[:availability_report][:number_of_beds])
    redirect_to admin_shelters_path
  end

  def load_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end
end
