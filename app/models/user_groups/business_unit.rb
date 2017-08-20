class BusinessUnit < ApplicationRecord
    include UserGroup
    has_many :offices, through: :users
    has_many :locations, through: :offices
    has_many :functions, through: :users
    has_many :departments, through: :users

    has_many :profit_centers, through: :users
    has_one :operating_company, through: :users
    has_one :companies, through: :users

    belongs_to :segment, optional: true
    belongs_to :division, optional: true

    acts_as_follower
end
