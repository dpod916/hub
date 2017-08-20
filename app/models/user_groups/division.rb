class Division < ApplicationRecord
    include UserGroup
    has_many :users
    has_many :offices, through: :users
    has_many :locations, through: :offices
    has_many :companies, through: :users
    has_many :departments, through: :users
    has_many :functions, through: :users
    has_many :profit_centers, through: :companies
    has_many :operating_companies, through: :companies
    has_many :business_units
    has_many :segments, through: :business_units
end
