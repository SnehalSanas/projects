require 'test_helper'

class V1::VillasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_villa = v1_villas(:one)
  end

  test "should get index" do
    get v1_villas_url
    assert_response :success
  end

  test "should get new" do
    get new_v1_villa_url
    assert_response :success
  end

  test "should create v1_villa" do
    assert_difference('V1::Villa.count') do
      post v1_villas_url, params: { v1_villa: {  } }
    end

    assert_redirected_to v1_villa_url(V1::Villa.last)
  end

  test "should show v1_villa" do
    get v1_villa_url(@v1_villa)
    assert_response :success
  end

  test "should get edit" do
    get edit_v1_villa_url(@v1_villa)
    assert_response :success
  end

  test "should update v1_villa" do
    patch v1_villa_url(@v1_villa), params: { v1_villa: {  } }
    assert_redirected_to v1_villa_url(@v1_villa)
  end

  test "should destroy v1_villa" do
    assert_difference('V1::Villa.count', -1) do
      delete v1_villa_url(@v1_villa)
    end

    assert_redirected_to v1_villas_url
  end
end
