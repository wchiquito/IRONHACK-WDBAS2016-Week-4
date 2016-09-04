require 'test_helper'

class TextInspectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get patata" do
    get text_inspections_patata_url
    assert_response :success
  end

end
