require 'test_helper'

class DependentsControllerTest < ActionController::TestCase
  setup do
    @dependent = dependents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dependents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dependent" do
    assert_difference('Dependent.count') do
      post :create, dependent: { kinship_type: @dependent.kinship_type, name: @dependent.name }
    end

    assert_redirected_to dependent_path(assigns(:dependent))
  end

  test "should show dependent" do
    get :show, id: @dependent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dependent
    assert_response :success
  end

  test "should update dependent" do
    patch :update, id: @dependent, dependent: { kinship_type: @dependent.kinship_type, name: @dependent.name }
    assert_redirected_to dependent_path(assigns(:dependent))
  end

  test "should destroy dependent" do
    assert_difference('Dependent.count', -1) do
      delete :destroy, id: @dependent
    end

    assert_redirected_to dependents_path
  end
end
