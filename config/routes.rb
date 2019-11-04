Rails.application.routes.draw do
  root "weather_dashboard#index"
  get 'weather_dashboard/detail_weather_report'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
