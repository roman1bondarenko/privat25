# frozen_string_literal: true

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test 'should be valid city' do
    country = Country.create(name: 'Ukraine', short_code: 'UA', phone_code: '380')
    city = City.create(name: 'Krop', country: country)
    assert city.valid?
  end

  test 'should be invalid city' do
    country = Country.create(name: 'Ukraine', short_code: 'UA', phone_code: '380')
    params = [
      { name: 'Krop' },
      { country: country }
    ]
    params.each do |param|
      city = City.create(name: param[:name], country: param[:country])
      assert city.invalid?
    end
  end
end
