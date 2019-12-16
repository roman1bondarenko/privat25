class City < ApplicationRecord
  belongs_to :country
  has_many :users

  validates_associated :users
  validates :name, presence: true
end
