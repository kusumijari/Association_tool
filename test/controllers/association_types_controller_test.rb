require 'test_helper'

class AssociationTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @association_type = association_types(:one)
  end

  test "should get index" do
    get association_types_url
    assert_response :success
  end

  test "should get new" do
    get new_association_type_url
    assert_response :success
  end

  test "should create association_type" do
    assert_difference('AssociationType.count') do
      post association_types_url, params: { association_type: { name: @association_type.name } }
    end

    assert_redirected_to association_type_url(AssociationType.last)
  end

  test "should show association_type" do
    get association_type_url(@association_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_association_type_url(@association_type)
    assert_response :success
  end

  test "should update association_type" do
    patch association_type_url(@association_type), params: { association_type: { name: @association_type.name } }
    assert_redirected_to association_type_url(@association_type)
  end

  test "should destroy association_type" do
    assert_difference('AssociationType.count', -1) do
      delete association_type_url(@association_type)
    end

    assert_redirected_to association_types_url
  end
end
