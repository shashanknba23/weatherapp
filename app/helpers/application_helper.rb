module ApplicationHelper

	def fetch_avg_temp(wheater_info)
  	# wheater_info = user_location.weather_deatil.weather_deatils_by_day
		normalized_data = wheater_info.values.group_by{ |weather| weather["week_day"] }.map do |weekday, weathers|
		weathers_sum = weathers.inject({"temp" => 0, "temp_min" => 0, "temp_max" => 0}) do |weathers_sum, weather|
		weathers_sum["temp"] = weathers_sum["temp"] + weather["temp"]
		weathers_sum["temp_min"] = weathers_sum["temp_min"] + weather["temp_min"]
		weathers_sum["temp_max"] = weathers_sum["temp_max"] + weather["temp_max"]
		weathers_sum
		end
		[weekday, weathers_sum.map{|key, value| [key, (value/weathers.count).round(2)]}.to_h]
		end.to_h
	end

end
