require "test_helper"

class Public::ToiletsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_toilets_index_url
    assert_response :success
  end
end
