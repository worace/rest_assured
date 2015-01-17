class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :days_open
      t.string :hours
      t.boolean :children_allowed
      t.boolean :women_only
      t.boolean :med_facilities
      t.boolean :short_term
      t.boolean :long_term
      t.boolean :pets_allowed
      t.string :phone
      t.string :age_range
      t.boolean :showers

      t.timestamps
    end
  end
end
