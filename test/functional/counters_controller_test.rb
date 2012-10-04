require 'test_helper'

class CountersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counter" do
    assert_difference('Counter.count') do
      post :create, :counter => { }
    end

    assert_redirected_to counter_path(assigns(:counter))
  end

  test "should show counter" do
    get :show, :id => counters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => counters(:one).to_param
    assert_response :success
  end

  test "should update counter" do
    put :update, :id => counters(:one).to_param, :counter => { }
    assert_redirected_to counter_path(assigns(:counter))
  end

  test "should destroy counter" do
    assert_difference('Counter.count', -1) do
      delete :destroy, :id => counters(:one).to_param
    end

    assert_redirected_to counters_path
  end
end
