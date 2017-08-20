require 'test_helper'

class OperatingCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operating_company = operating_companies(:one)
  end

  test "should get index" do
    get operating_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_operating_company_url
    assert_response :success
  end

  test "should create operating_company" do
    assert_difference('OperatingCompany.count') do
      post operating_companies_url, params: { operating_company: { name: @operating_company.name } }
    end

    assert_redirected_to operating_company_url(OperatingCompany.last)
  end

  test "should show operating_company" do
    get operating_company_url(@operating_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_operating_company_url(@operating_company)
    assert_response :success
  end

  test "should update operating_company" do
    patch operating_company_url(@operating_company), params: { operating_company: { name: @operating_company.name } }
    assert_redirected_to operating_company_url(@operating_company)
  end

  test "should destroy operating_company" do
    assert_difference('OperatingCompany.count', -1) do
      delete operating_company_url(@operating_company)
    end

    assert_redirected_to operating_companies_url
  end
end
