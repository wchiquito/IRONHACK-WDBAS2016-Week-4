require 'test_helper'

class TwotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twot = twots(:one)
  end

  test "should get index" do
    get twots_url
    assert_response :success
  end

  test "should get new" do
    get new_twot_url
    assert_response :success
  end

  test "should create twot" do
    assert_difference('Twot.count') do
      post twots_url, params: { twot: { body: @twot.body } }
    end

    assert_redirected_to twot_url(Twot.last)
  end

  test "should show twot" do
    get twot_url(@twot)
    assert_response :success
  end

  test "should get edit" do
    get edit_twot_url(@twot)
    assert_response :success
  end

  test "should update twot" do
    patch twot_url(@twot), params: { twot: { body: @twot.body } }
    assert_redirected_to twot_url(@twot)
  end

  test "should destroy twot" do
    assert_difference('Twot.count', -1) do
      delete twot_url(@twot)
    end

    assert_redirected_to twots_url
  end
end
