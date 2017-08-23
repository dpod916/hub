class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.datetime :initial_registration_date
      t.datetime :last_update_date
      t.string :registration_status
      t.datetime :next_renewal_date
      t.references :local_operating_unit, foreign_key: true
      t.string :validation_sources
      t.references :legal_entity, foreign_key: true

      t.timestamps
    end
  end
end
