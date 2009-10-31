require 'test_helper'

class SubmitionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submition" do
    assert_difference('Submition.count') do
      post :create, :submition => { }
    end

    assert_redirected_to submition_path(assigns(:submition))
  end

  test "should show submition" do
    get :show, :id => submitions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => submitions(:one).to_param
    assert_response :success
  end

  test "should update submition" do
    put :update, :id => submitions(:one).to_param, :submition => { }
    assert_redirected_to submition_path(assigns(:submition))
  end

  test "should destroy submition" do
    assert_difference('Submition.count', -1) do
      delete :destroy, :id => submitions(:one).to_param
    end

    assert_redirected_to submitions_path
  end
end
