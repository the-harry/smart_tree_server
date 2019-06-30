class Garden < ApplicationRecord
  has_many :trees

  validates :host, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
