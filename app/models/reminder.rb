class Reminder < ApplicationRecord
  belongs_to :remindor, polymorphic: true
  belongs_to :remindee, polymorphic: true
  belongs_to :remindable, polymorphic: true
  include PublicActivity::Common
end
