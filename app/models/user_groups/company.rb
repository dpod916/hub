class Company < ApplicationRecord
    include UserGroup
	has_many :parent_companies
	has_many :companies, through: :parent_companies, source: :parent, :foreign_key => 'parent_id'
	has_many :parents, through: :parent_companies, source: :company
	has_closure_tree dependent: :delete_all, with_advisory_lock: false
	has_many :users
    has_many :offices, through: :users
    has_many :locations, through: :offices
    has_many :functions, through: :users
    has_many :departments, through: :users
    has_many :divisions, through: :users
    has_many :profit_centers, through: :users
    has_one :operating_company, through: :users
    has_one :business_units, through: :users


	def to_digraph_label
    	self.name
  	end
end

