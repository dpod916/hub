class ChangeEmployeeProfileToEmployee < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :employee_profiles, :employees
  end

  def self.down
    rename_table :employees, :employee_profiles
  end
end
