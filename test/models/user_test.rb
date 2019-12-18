# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  user_params =
    { first_name: 'Roman', second_name: 'Bondarenko', email: 'mymail@gmail.com',
      gender: User.genders[:male], birthday: '1998-12-03', phone: '095782341',
      password: 'password', city: City.first.id }

  test 'should be valid user ' do
    params = [
      { first_name: 'Roman', second_name: 'Bondarenko', email: 'mymail@gmail.com',
        gender: User.genders[:male], birthday: '1998-12-03', phone: '095782341',
        password: 'password', city: City.first.id },
      { first_name: 'Roman', second_name: 'Bondarenko', email: 'mymail2@gmail.com',
        birthday: '1998-12-03', phone: '095782341',
        password: 'password', city: City.first.id }
    ]
    params.each do |param|
      user = User.create(param)
      assert user.valid?
    end
  end

  test 'should be invalid user if missing param' do
    # gender dont need to remove because by default it set 0 if missing
    params_to_remove = %i[first_name second_name email birthday phone password city]
    params_to_remove.each do |param|
      user = User.create(user_params.except(param))
      assert user.invalid?
    end
  end

  test 'should be invalid user when incorrect email and phone' do
    emails = %w[my@ @ @mail.com my@mail.1- mail]
    phones = %w[1234567q q qqq q1234567 @12345]
    test_contact_values(User, user_params, 'email', emails)
    test_contact_values(User, user_params, 'phone', phones)
  end
end
