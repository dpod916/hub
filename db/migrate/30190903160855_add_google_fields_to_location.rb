class AddGoogleFieldsToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :reference, :string
    add_column :locations, :vicinity, :string
    add_column :locations, :name, :string
    add_column :locations, :icon, :string
    add_column :locations, :formatted_phone_number, :string
    add_column :locations, :formatted_address, :string
    add_column :locations, :rating, :string
    add_column :locations, :url, :string
  end
end
