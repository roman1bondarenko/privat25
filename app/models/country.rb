class Country < ApplicationRecord
  has_many :cities

  validates_associated :cities
  validates :name, :phone_code, :short_code, presence: true
  validates :phone_code, format: { with: /[+][0-9]+/ }
end
