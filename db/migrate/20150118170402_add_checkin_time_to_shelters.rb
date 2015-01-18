class AddCheckinTimeToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :checkin_time, :datetime
  end
end
