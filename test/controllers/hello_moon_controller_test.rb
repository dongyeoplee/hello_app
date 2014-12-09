require 'test_helper'

class HelloMoonControllerTest < ActionController::TestCase
  test "should get bla" do
    get :bla
    assert_response :success
  end

  test "should get moa" do
    get :moa
    assert_response :success
  end

  test "should get dea" do
    get :dea
    assert_response :success
  end

end
