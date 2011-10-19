require 'test_helper'

class ShedulersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shedulers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sheduler" do
    assert_difference('Sheduler.count') do
      post :create, :sheduler => { }
    end

    assert_redirected_to sheduler_path(assigns(:sheduler))
  end

  test "should show sheduler" do
    get :show, :id => shedulers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shedulers(:one).to_param
    assert_response :success
  end

  test "should update sheduler" do
    put :update, :id => shedulers(:one).to_param, :sheduler => { }
    assert_redirected_to sheduler_path(assigns(:sheduler))
  end

  test "should destroy sheduler" do
    assert_difference('Sheduler.count', -1) do
      delete :destroy, :id => shedulers(:one).to_param
    end

    assert_redirected_to shedulers_path
  end
end
