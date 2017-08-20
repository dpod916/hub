require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { company_number: @company.company_number, functional_currency: @company.functional_currency, hfm_entity_code: @company.hfm_entity_code, hfm_hv_code: @company.hfm_hv_code, hfm_tax_entity: @company.hfm_tax_entity, method_of_combination: @company.method_of_combination, name: @company.name, reported_as: @company.reported_as } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { company_number: @company.company_number, functional_currency: @company.functional_currency, hfm_entity_code: @company.hfm_entity_code, hfm_hv_code: @company.hfm_hv_code, hfm_tax_entity: @company.hfm_tax_entity, method_of_combination: @company.method_of_combination, name: @company.name, reported_as: @company.reported_as } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
