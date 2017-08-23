class AddFieldsToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
    add_column :locations, :state_code, :string
    add_column :locations, :postal_code, :string
    add_column :locations, :country_code, :string
  end
end
