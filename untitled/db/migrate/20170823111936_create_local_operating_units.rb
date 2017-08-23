class CreateLocalOperatingUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :local_operating_units do |t|
      t.string :lei
      t.string :name
      t.integer :record_count
      t.string :content_data
      t.datetime :last_attempted_download_date
      t.datetime :last_successful_download_date
      t.datetime :last_valid_download_date

      t.timestamps
    end
  end
end
