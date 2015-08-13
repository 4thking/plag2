require 'test_helper'

class TakeTestsControllerTest < ActionController::TestCase
  setup do
    @take_test = take_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:take_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create take_test" do
    assert_difference('TakeTest.count') do
      post :create, take_test: {  }
    end

    assert_redirected_to take_test_path(assigns(:take_test))
  end

  test "should show take_test" do
    get :show, id: @take_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @take_test
    assert_response :success
  end

  test "should update take_test" do
    patch :update, id: @take_test, take_test: {  }
    assert_redirected_to take_test_path(assigns(:take_test))
  end

  test "should destroy take_test" do
    assert_difference('TakeTest.count', -1) do
      delete :destroy, id: @take_test
    end

    assert_redirected_to take_tests_path
  end
end
