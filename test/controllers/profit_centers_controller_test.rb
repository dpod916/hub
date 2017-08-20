require 'test_helper'

class ProfitCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profit_center = profit_centers(:one)
  end

  test "should get index" do
    get profit_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_profit_center_url
    assert_response :success
  end

  test "should create profit_center" do
    assert_difference('ProfitCenter.count') do
      post profit_centers_url, params: { profit_center: { name: @profit_center.name } }
    end

    assert_redirected_to profit_center_url(ProfitCenter.last)
  end

  test "should show profit_center" do
    get profit_center_url(@profit_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_profit_center_url(@profit_center)
    assert_response :success
  end

  test "should update profit_center" do
    patch profit_center_url(@profit_center), params: { profit_center: { name: @profit_center.name } }
    assert_redirected_to profit_center_url(@profit_center)
  end

  test "should destroy profit_center" do
    assert_difference('ProfitCenter.count', -1) do
      delete profit_center_url(@profit_center)
    end

    assert_redirected_to profit_centers_url
  end
end
