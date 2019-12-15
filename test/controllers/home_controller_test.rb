require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get RU root" do
    get '/ru'
    assert_response :success
  end

  test "should get EN root" do
    get '/en'
    assert_response :success
  end

  test "should redirect to default locale" do
    get '/'
    assert_response :redirect
  end
end
