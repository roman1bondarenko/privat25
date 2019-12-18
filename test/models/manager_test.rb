# frozen_string_literal: true

require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  params = { first_name: 'Roman', second_name: 'Bondarenko',
             email: 'managermail@gmail.com', password: 'password' }

  test 'should create and be a valid manager ' do
    params = { first_name: 'Dan', second_name: 'White',
               email: 'danwhite@gmail.com', password: 'password' }
    manager = Manager.create(params)
    assert manager.valid?
  end

  test 'should be invalid manager if missing required param' do
    params_to_delete = %i[first_name second_name email password]
    test_missing_params(Manager, params, params_to_delete)
  end

  test 'should be invalid when incorrect email' do
    emails = %w[my@ @ @mail.com my@mail.1- mail]
    test_contact_values(Manager, params, 'email', emails)
  end
end
