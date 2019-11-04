class CreateWeatherDeatils < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_deatils do |t|
      t.integer :user_location_id
      t.json :weather_deatils_by_day

      t.timestamps
    end
  end
end
