require 'test_helper'

class WeatherDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_dashboard_index_url
    assert_response :success
  end

end
