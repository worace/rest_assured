class CreateAvailabilityReports < ActiveRecord::Migration
  def change
    create_table :availability_reports do |t|
      t.integer :number_of_beds
      t.integer :shelter_id

      t.timestamps
    end
  end
end
