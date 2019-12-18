# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  protected

  def test_missing_params(model, params, params_to_delete)
    params_to_delete.each do |param|
      model_obj = model.create(params.except(param))
      assert model_obj.invalid?
    end
  end

  def test_contact_values(model, params, contact_cell_name, data_to_test)
    data_to_test.each do |data|
      params[contact_cell_name] = data
      model_obj = model.create(params)
      assert model_obj.invalid?
    end
  end
end
