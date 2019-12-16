# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
    user_params =
      { first_name: 'Roman', second_name: 'Bondarenko', email: 'mymail@gmail.com',
        gender: User.genders[:male], birthday: '1998-12-03', phone: '095782341',
        password: 'password', city: City.first.id }

    # gender dont need to remove because by default it set 0 if missing
    params_to_remove = %i[first_name second_name email birthday phone password city]
    params_to_remove.each do |param|
      user = User.create(user_params.except(param))
      assert user.invalid?
    end
  end

  test 'should be invalid user when incorrect email and phone' do
    param = { first_name: 'Roman', second_name: 'Bondarenko', email: nil,
              gender: User.genders[:male], birthday: '1998-12-03', phone: '095782341',
              password: 'password', city: City.first.id }
    emails = %w[my@ @ @mail.com my@mail.1- mail]
    phones = %w[1234567q q qqq q1234567 @12345]
    test_contact_values(param, 'email', emails)
    test_contact_values(param, 'phone', phones)
  end
end

def test_contact_values(user_params, contact_cell_name, data_to_test)
  data_to_test.each do |data|
    user_params[contact_cell_name] = data
    user = User.create(user_params)
    assert user.invalid?
  end
end
