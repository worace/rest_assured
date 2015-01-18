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
    Shelter.find(params[:id]).update_attributes(shelter_params)
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
    redirect_to admin_root_path
  end

  def shelter_params
    shelter_params = params.require(:shelter).permit(Shelter.column_names - ["id", "created_at", "updated_at"])
    if params[:shelter][:checkin_time].present?
      shelter_params.merge(:checkin_time => Time.parse(params[:shelter][:checkin_time]))
    else
      shelter_params
    end
  end
end
