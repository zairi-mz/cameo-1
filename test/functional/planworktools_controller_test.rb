require 'test_helper'

class PlanworktoolsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planworktools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planworktool" do
    assert_difference('Planworktool.count') do
      post :create, :planworktool => { }
    end

    assert_redirected_to planworktool_path(assigns(:planworktool))
  end

  test "should show planworktool" do
    get :show, :id => planworktools(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => planworktools(:one).to_param
    assert_response :success
  end

  test "should update planworktool" do
    put :update, :id => planworktools(:one).to_param, :planworktool => { }
    assert_redirected_to planworktool_path(assigns(:planworktool))
  end

  test "should destroy planworktool" do
    assert_difference('Planworktool.count', -1) do
      delete :destroy, :id => planworktools(:one).to_param
    end

    assert_redirected_to planworktools_path
  end
end
