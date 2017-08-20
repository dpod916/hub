class ProfitCenter < ApplicationRecord
  include UserGroup
  has_many :users
  has_one :company, through: :users
  has_one :operating_company, through: :company
  has_one :business_unit, through: :company
  has_many :offices, through: :users
  has_many :locations, through: :offices
  has_one :department, through: :users
  has_one :division, through: :users
  has_many :functions, through: :users

end
