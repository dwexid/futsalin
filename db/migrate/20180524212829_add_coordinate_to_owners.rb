class AddCoordinateToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :lat, :float
    add_column :owners, :lang, :float
  end
end
