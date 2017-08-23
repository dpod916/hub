class Employee < ApplicationRecord
 

  # belongs_to :business_unit, optional: true
  # belongs_to :company, optional: true
  # belongs_to :operating_company, optional: true
  # belongs_to :profit_center, optional: true
  # belongs_to :department, optional: true
  # belongs_to :division, optional: true
  # belongs_to :function, optional: true
  # belongs_to :office, optional: true
  # has_one :location, through: :office
  # belongs_to :segment, optional: true
  # belongs_to :country, optional: true

  # delegate :name, to: :business_unit, prefix: true, allow_nil: true
  # delegate :name, to: :company, prefix: true, allow_nil: true
  # delegate :name, to: :profit_center, prefix: true, allow_nil: true
  # delegate :name, to: :department, prefix: true, allow_nil: true
  # delegate :name, to: :division, prefix: true, allow_nil: true
  # delegate :name, to: :function, prefix: true, allow_nil: true
  # delegate :name, to: :office, prefix: true, allow_nil: true
  # delegate :name, to: :location, prefix: true, allow_nil: true
  # delegate :name, to: :segment, prefix: true, allow_nil: true
  # delegate :name, to: :country, prefix: true, allow_nil: true


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def employee_name
   self.distinguished_name.nil? ? self.full_name : self.distinguished_name.split(",")[0].gsub!("CN=", "")
  end


end
