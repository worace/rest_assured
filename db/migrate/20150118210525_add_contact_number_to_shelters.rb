class AddContactNumberToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :contact_number, :string, :default => "3343540566"
  end
end
