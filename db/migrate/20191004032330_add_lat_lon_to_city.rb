class AddLatLonToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :latitude, :real
    add_column :cities, :longitude, :real
  end
end
