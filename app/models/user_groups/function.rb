class Function < ApplicationRecord
    include UserGroup
    has_many :users
    has_many :offices, through: :users
    has_many :locations, through: :offices
    has_many :companies, through: :users
    has_many :divisions, through: :users
    has_many :profit_centers, through: :companies
    has_many :operating_companies, through: :companies
    has_one :business_units, through: :users

    has_many :job_titles
    belongs_to :department, optional: true
end
