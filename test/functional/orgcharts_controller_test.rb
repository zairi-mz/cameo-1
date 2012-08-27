require 'test_helper'

class OrgchartsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgcharts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgchart" do
    assert_difference('Orgchart.count') do
      post :create, :orgchart => { }
    end

    assert_redirected_to orgchart_path(assigns(:orgchart))
  end

  test "should show orgchart" do
    get :show, :id => orgcharts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => orgcharts(:one).to_param
    assert_response :success
  end

  test "should update orgchart" do
    put :update, :id => orgcharts(:one).to_param, :orgchart => { }
    assert_redirected_to orgchart_path(assigns(:orgchart))
  end

  test "should destroy orgchart" do
    assert_difference('Orgchart.count', -1) do
      delete :destroy, :id => orgcharts(:one).to_param
    end

    assert_redirected_to orgcharts_path
  end
end
