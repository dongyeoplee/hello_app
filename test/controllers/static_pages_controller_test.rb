require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
	def setup
		@hello_moon = "hello world"
	end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "h1", "#{@hello_moon}"
  	assert_select "span", "span text"
  end 

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end

end
