class EmployeeRelationship < ApplicationRecord
  belongs_to :company
  belongs_to :profit_center
  belongs_to :office
  belongs_to :function
  belongs_to :segment
  belongs_to :business_unit
  belongs_to :department
  belongs_to :division
  belongs_to :user
end
