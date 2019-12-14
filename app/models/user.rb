class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :city

  enum gender: { male: 0, female: 1 }

  def city=(city_id)
    super(City.find(city_id))
  end

  def gender=(value)
    value = value.to_i
    super(value)
  end
end
