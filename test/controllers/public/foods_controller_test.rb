require "test_helper"

class Public::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_foods_index_url
    assert_response :success
  end
end
