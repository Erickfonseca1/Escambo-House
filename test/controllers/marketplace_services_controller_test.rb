require "test_helper"

class MarketplaceServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marketplace_services_index_url
    assert_response :success
  end
end
