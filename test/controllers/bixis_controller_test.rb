require 'test_helper'

class BixisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bixi = bixis(:one)
  end

  test "should get index" do
    get bixis_url
    assert_response :success
  end

  test "should get new" do
    get new_bixi_url
    assert_response :success
  end

  test "should create bixi" do
    assert_difference('Bixi.count') do
      post bixis_url, params: { bixi: {  } }
    end

    assert_redirected_to bixi_url(Bixi.last)
  end

  test "should show bixi" do
    get bixi_url(@bixi)
    assert_response :success
  end

  test "should get edit" do
    get edit_bixi_url(@bixi)
    assert_response :success
  end

  test "should update bixi" do
    patch bixi_url(@bixi), params: { bixi: {  } }
    assert_redirected_to bixi_url(@bixi)
  end

  test "should destroy bixi" do
    assert_difference('Bixi.count', -1) do
      delete bixi_url(@bixi)
    end

    assert_redirected_to bixis_url
  end
end
