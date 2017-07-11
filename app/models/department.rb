class Department < ApplicationRecord
  validates_presence_of :name
  belongs_to :event
end
