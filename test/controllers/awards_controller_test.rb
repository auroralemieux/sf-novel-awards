require 'test_helper'

class AwardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get awards_index_url
    assert_response :success
  end

  test "should get show" do
    get awards_show_url
    assert_response :success
  end

  test "should get new" do
    get awards_new_url
    assert_response :success
  end

  test "should get create" do
    get awards_create_url
    assert_response :success
  end

  test "should get edit" do
    get awards_edit_url
    assert_response :success
  end

  test "should get update" do
    get awards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get awards_destroy_url
    assert_response :success
  end

end
