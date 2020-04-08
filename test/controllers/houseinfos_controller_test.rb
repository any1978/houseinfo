require 'test_helper'

class HouseinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get houseinfos_index_url
    assert_response :success
  end

end
