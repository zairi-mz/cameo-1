require 'test_helper'

class MaintenancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance" do
    assert_difference('Maintenance.count') do
      post :create, :maintenance => { }
    end

    assert_redirected_to maintenance_path(assigns(:maintenance))
  end

  test "should show maintenance" do
    get :show, :id => maintenances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => maintenances(:one).to_param
    assert_response :success
  end

  test "should update maintenance" do
    put :update, :id => maintenances(:one).to_param, :maintenance => { }
    assert_redirected_to maintenance_path(assigns(:maintenance))
  end

  test "should destroy maintenance" do
    assert_difference('Maintenance.count', -1) do
      delete :destroy, :id => maintenances(:one).to_param
    end

    assert_redirected_to maintenances_path
  end
end
