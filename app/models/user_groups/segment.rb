class Segment < ApplicationRecord
    include UserGroup
	has_many :users
	has_many :business_units
	has_many :divisions, through: :business_units
end
