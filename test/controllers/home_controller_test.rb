# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get RU root' do
    get '/ru'
    assert_response :success
  end

  test 'should get RU locale' do
    get '/ru'
    assert_select 'p', 'Регистрация пользователей, открытие кредитных, депозитных счетов. ' \
                       'Пользователи имеют возможность, отправлять средства со счета, на счет. Скачивать выписки счетов.'
  end

  test 'should get EN root' do
    get '/en'
    assert_response :success
  end

  test 'should get EN locale' do
    get '/en'
    assert_select 'p', 'User registration, opening credit, deposit accounts. ' \
                       'Users have the ability to send funds from account to account.      Download billing statements.'
  end

  test 'should redirect to default locale' do
    get '/'
    assert_response :redirect
  end
end
