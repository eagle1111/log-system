class Job < ApplicationRecord
  validates_presence_of :name
  belongs_to :event
  has_many :registrations
end
