class GetWeatherDetailsService < ApplicationService



  def initialize(ip)
  	@ip = ip
	end

	def call
		@user_location = create_user_location(@ip)
		user_location.weather_deatil
  end


  private
	  def create_user_location(ip)
			address = Geocoder.search(ip).first
			user_location = UserLocation.first_user_location(ip).update_or_create(
				ip_address: ip,
				latitude: address.coordinates.first,
				longitude: address.coordinates.last,
				pincode: address.postal,
				country: address.country,
				city: address.city,
				state: address.region
	    )
	    create_weather_deatil_for_next_five_days
	  end

	  def create_weather_deatil_for_next_five_days
	  	open_weather_api = Rails.configuration.open_weather_api
	  	result = open_weather_api.forecast :hourly, lon: user_location.longitude, lat: user_location.latitude
	  	a = {}
	  	result[:list].each do |li, index|
	  		next if li["dt_txt"].to_date == Date.today
	  		next if li["dt_txt"].to_date < Date.today
		  	temp = (li["main"]["temp"] - 273.15).round(2)
		  	temp_min = (li["main"]["temp_min"] - 273.15).round(2)
		  	temp_max = (li["main"]["temp_max"] - 273.15).round(2)
    		a[li["dt_txt"]] = {date_time: li["dt_txt"],week_day: li["dt_txt"].to_date.strftime('%A'),temp: temp, temp_min: temp_min, temp_max: temp_max}
    	end
    	current_weather = open_weather_api.current lon: user_location.longitude, lat: user_location.latitude
    	WeatherDeatil.where(user_location_id: user_location.id).update_or_create(
    		current_date: Time.now,
    		current_day: Time.now.to_date.strftime('%A'),
    		current_temp: (current_weather["main"]["temp"] - 273.15).round(2),
    		current_temp_min: (current_weather["main"]["temp_min"] - 273.15).round(2),
    		current_temp_max: (current_weather["main"]["temp_min"] - 273.15).round(2),
    		weather_deatils_by_day: a)

	  end

	  def user_location
	  	user_location = UserLocation.find_by_ip_address(@ip)
	  end
end