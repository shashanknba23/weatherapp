class AddCoumnsToWeatherDeatils < ActiveRecord::Migration[5.2]
  def change
    add_column :weather_deatils, :current_date, :datetime
    add_column :weather_deatils, :current_temp, :decimal
    add_column :weather_deatils, :current_day, :string
    add_column :weather_deatils, :current_temp_min, :decimal
    add_column :weather_deatils, :current_temp_max, :decimal

  end
end
