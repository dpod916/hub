class AddFieldsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :company_number, :float
    add_column :companies, :method_of_combination, :string
    add_column :companies, :reported_as, :string
    add_column :companies, :functional_currency, :string
    add_column :companies, :hfm_entity_code, :string
    add_column :companies, :hfm_tax_entity, :string
    add_column :companies, :hfm_hv_code, :string
    add_column :companies, :lei, :string
  end
end
