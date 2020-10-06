require 'test_helper'

class FiltrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get filtros_index_url
    assert_response :success
  end

  test "should get new" do
    get filtros_new_url
    assert_response :success
  end

  test "should get create" do
    get filtros_create_url
    assert_response :success
  end

  test "should get destroy" do
    get filtros_destroy_url
    assert_response :success
  end

end
