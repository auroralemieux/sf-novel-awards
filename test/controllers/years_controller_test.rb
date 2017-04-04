require 'test_helper'

class YearsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get years_index_url
    assert_response :success
  end

  test "should get show" do
    get years_show_url
    assert_response :success
  end

  test "should get new" do
    get years_new_url
    assert_response :success
  end

  test "should get create" do
    get years_create_url
    assert_response :success
  end

  test "should get edit" do
    get years_edit_url
    assert_response :success
  end

  test "should get update" do
    get years_update_url
    assert_response :success
  end

  test "should get delete" do
    get years_delete_url
    assert_response :success
  end

end
