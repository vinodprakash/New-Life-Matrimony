require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get basic_info" do
    get users_basic_info_url
    assert_response :success
  end

  test "should get address" do
    get users_address_url
    assert_response :success
  end

  test "should get horoscope" do
    get users_horoscope_url
    assert_response :success
  end

  test "should get occupation" do
    get users_occupation_url
    assert_response :success
  end

end
