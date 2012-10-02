require 'test_helper'

class PlanworkhoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planworkhours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planworkhour" do
    assert_difference('Planworkhour.count') do
      post :create, :planworkhour => { }
    end

    assert_redirected_to planworkhour_path(assigns(:planworkhour))
  end

  test "should show planworkhour" do
    get :show, :id => planworkhours(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => planworkhours(:one).to_param
    assert_response :success
  end

  test "should update planworkhour" do
    put :update, :id => planworkhours(:one).to_param, :planworkhour => { }
    assert_redirected_to planworkhour_path(assigns(:planworkhour))
  end

  test "should destroy planworkhour" do
    assert_difference('Planworkhour.count', -1) do
      delete :destroy, :id => planworkhours(:one).to_param
    end

    assert_redirected_to planworkhours_path
  end
end
