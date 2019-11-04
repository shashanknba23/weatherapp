class WeatherDashboardController < ApplicationController
  def index
  	@weather_details = GetWeatherDetailsService.call(get_ip_address)
  end

  def detail_weather_report
  	@detail_weather_details = GetWeatherDetailsService.call(get_ip_address)
  end
end
