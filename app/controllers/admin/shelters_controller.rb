class Admin::SheltersController < Admin::BaseController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    checkin_time = Time.parse(params[:shelter][:checkin_time]) if params[:shelter][:checkin_time]
    Shelter.find(params[:id]).update_attributes(shelter_params.merge(:checkin_time => checkin_time))
    redirect_to admin_shelters_path
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to admin_shelters_path
    else
      render :new
    end
  end

  def destroy
    Shelter.find(params[:id]).destroy
    redirect_to admin_shelters_path
  end

  def shelter_params
    params.require(:shelter).permit(Shelter.column_names - ["id", "created_at", "updated_at"])
  end
end
