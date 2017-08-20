class Office < ApplicationRecord
  include UserGroup
  belongs_to :location, optional: true
  has_many :users
  has_many :offices, through: :users
  has_many :functions, through: :users
  has_many :departments, through: :users
  has_many :divisions, through: :users
  has_many :profit_centers, through: :users
  has_one :operating_company, through: :users
  has_one :business_units, through: :users
  has_one :companies, through: :users

end
