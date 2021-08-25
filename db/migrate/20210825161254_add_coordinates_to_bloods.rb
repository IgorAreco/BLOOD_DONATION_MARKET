class AddCoordinatesToBloods < ActiveRecord::Migration[6.0]
  def change
    add_column :bloods, :latitude, :float
    add_column :bloods, :longitude, :float
  end
end
