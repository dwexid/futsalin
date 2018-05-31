class CreateLapangs < ActiveRecord::Migration[5.1]
  def change
    create_table :lapangs do |t|
      t.integer :id_owner
      t.string :nama_lapang
      t.integer :harga_perjam
      t.string :jenis

      t.timestamps
    end
  end
end
