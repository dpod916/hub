class JobTitle < ApplicationRecord
  include UserGroup
  belongs_to :function, optional: true
  belongs_to :department, optional: true
end
