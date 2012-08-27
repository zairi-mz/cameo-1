require 'test_helper'

class MaintgroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintgroup" do
    assert_difference('Maintgroup.count') do
      post :create, :maintgroup => { }
    end

    assert_redirected_to maintgroup_path(assigns(:maintgroup))
  end

  test "should show maintgroup" do
    get :show, :id => maintgroups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => maintgroups(:one).to_param
    assert_response :success
  end

  test "should update maintgroup" do
    put :update, :id => maintgroups(:one).to_param, :maintgroup => { }
    assert_redirected_to maintgroup_path(assigns(:maintgroup))
  end

  test "should destroy maintgroup" do
    assert_difference('Maintgroup.count', -1) do
      delete :destroy, :id => maintgroups(:one).to_param
    end

    assert_redirected_to maintgroups_path
  end
end
