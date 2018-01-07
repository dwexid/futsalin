class AddImageToLapangs < ActiveRecord::Migration[5.1]
  def change
    add_column :lapangs, :image, :string, after: :jenis
  end
end
