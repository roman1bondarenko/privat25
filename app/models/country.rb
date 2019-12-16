# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :cities

  validates_associated :cities
  validates :name, :phone_code, :short_code, presence: true
  validates :phone_code, format: { with: /\A\d+\z/,
                                   message: 'Phone code may contain only numbers' }
end
