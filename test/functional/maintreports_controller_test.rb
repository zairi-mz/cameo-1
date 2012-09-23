require 'test_helper'

class MaintreportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintreports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintreport" do
    assert_difference('Maintreport.count') do
      post :create, :maintreport => { }
    end

    assert_redirected_to maintreport_path(assigns(:maintreport))
  end

  test "should show maintreport" do
    get :show, :id => maintreports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => maintreports(:one).to_param
    assert_response :success
  end

  test "should update maintreport" do
    put :update, :id => maintreports(:one).to_param, :maintreport => { }
    assert_redirected_to maintreport_path(assigns(:maintreport))
  end

  test "should destroy maintreport" do
    assert_difference('Maintreport.count', -1) do
      delete :destroy, :id => maintreports(:one).to_param
    end

    assert_redirected_to maintreports_path
  end
end
