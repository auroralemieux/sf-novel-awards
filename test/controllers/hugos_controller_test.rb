require 'test_helper'

class HugosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hugos_index_url
    assert_response :success
  end

  test "should get show" do
    get hugos_show_url
    assert_response :success
  end

  test "should get new" do
    get hugos_new_url
    assert_response :success
  end

  test "should get create" do
    get hugos_create_url
    assert_response :success
  end

  test "should get edit" do
    get hugos_edit_url
    assert_response :success
  end

  test "should get update" do
    get hugos_update_url
    assert_response :success
  end

  test "should get delete" do
    get hugos_delete_url
    assert_response :success
  end

end
