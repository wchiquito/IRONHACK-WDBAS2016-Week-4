require 'test_helper'

class AsciisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get asciis_new_url
    assert_response :success
  end

end
