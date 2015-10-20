class AlterPlacesAddLatAndLng < ActiveRecord::Migration
  def change
  	add_column :places, :latitude, :float #adds latitude & longitude columns to db
  	add_column :places, :longitude, :float
  end
end
