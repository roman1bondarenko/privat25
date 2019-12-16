# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :cities

  validates_associated :cities
  validates :name, :phone_code, :short_code, presence: true
  validates :phone_code, numericality: { only_integer: true ,
                                   message: 'Phone code may contain only numbers' }
end
