# frozen_string_literal: true

class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :second_name, :email, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
