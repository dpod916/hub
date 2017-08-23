class Registration < ApplicationRecord
  belongs_to :local_operating_unit
  belongs_to :legal_entity
end
