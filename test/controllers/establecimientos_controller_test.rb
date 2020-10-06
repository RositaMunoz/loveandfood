require 'test_helper'

class EstablecimientosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get establecimientos_new_url
    assert_response :success
  end

  test "should get índex" do
    get establecimientos_índex_url
    assert_response :success
  end

  test "should get show" do
    get establecimientos_show_url
    assert_response :success
  end

  test "should get edit" do
    get establecimientos_edit_url
    assert_response :success
  end

end
