# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city

  validates :first_name, :second_name, :email,
            :gender, :birthday, :phone, presence: true

  validates :phone, numericality: { only_integer: true,
                                    message: ' number may contain only numbers' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum gender: { male: 0, female: 1 }

  # TODO: fix this?
  def city=(city_id)
    super(City.find(city_id))
  end

  def gender=(value)
    value = value.to_i
    super(value)
  end

  def full_name
    "#{first_name} #{second_name}"
  end
end
