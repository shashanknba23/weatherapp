OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = "6ebe90573d1b975c10a22dd4357c9b8b"

  # Optionals
  config.default_language = 'en'     # 'en' by default
  config.default_country_code = 'in' # nil by default (ISO 3166-1 alfa2)
  config.default_units = 'celsius'    # 'metric' by default
end
