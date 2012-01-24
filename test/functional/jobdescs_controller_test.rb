require 'test_helper'

class JobdescsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobdescs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobdesc" do
    assert_difference('Jobdesc.count') do
      post :create, :jobdesc => { }
    end

    assert_redirected_to jobdesc_path(assigns(:jobdesc))
  end

  test "should show jobdesc" do
    get :show, :id => jobdescs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => jobdescs(:one).to_param
    assert_response :success
  end

  test "should update jobdesc" do
    put :update, :id => jobdescs(:one).to_param, :jobdesc => { }
    assert_redirected_to jobdesc_path(assigns(:jobdesc))
  end

  test "should destroy jobdesc" do
    assert_difference('Jobdesc.count', -1) do
      delete :destroy, :id => jobdescs(:one).to_param
    end

    assert_redirected_to jobdescs_path
  end
end
