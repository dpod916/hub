class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :second_line
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.string :full_address
      t.float :lng
      t.float :lat
      t.string :type
      t.references :legal_entity, foreign_key: true

      t.timestamps
    end
  end
end
