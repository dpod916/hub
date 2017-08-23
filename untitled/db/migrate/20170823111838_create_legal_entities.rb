class CreateLegalEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :legal_entities do |t|
      t.string :lei
      t.string :legal_name
      t.string :business_register_entity_id
      t.string :legal_jurisdiction
      t.string :legal_form
      t.string :entity_status

      t.timestamps
    end
  end
end
