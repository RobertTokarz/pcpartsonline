require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homecategory" do
    get static_pages_homecategory_url
    assert_response :success
  end

end
