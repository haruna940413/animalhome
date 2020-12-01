require 'test_helper'

class Hostuser::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hostuser_inquiries_index_url
    assert_response :success
  end

  test "should get show" do
    get hostuser_inquiries_show_url
    assert_response :success
  end

end
