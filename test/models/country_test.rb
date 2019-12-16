# frozen_string_literal: true

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test 'should be valid country' do
    country = Country.create(name: 'Ukraine', short_code: 'UA', phone_code: '380')
    assert country.valid?
  end

  test 'should be invalid country' do
    params = [
      { name: 'USA' },
      { name: 'USA', phone_code: '1d' },
      { phone_code: '1', short_code: 'US' },
      { name: 'USA', phone_code: '12ds', short_code: 'US' }
    ]
    params.each do |param|
      country = Country.create(param)
      assert country.invalid?
    end
  end
end
