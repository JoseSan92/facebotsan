require 'test_helper'

class CallbackControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get callback_index_url
    assert_response :success
  end

  test "should get recivied" do
    get callback_recivied_url
    assert_response :success
  end

end
