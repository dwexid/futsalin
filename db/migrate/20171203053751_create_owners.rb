class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :nama_tempat
      t.string :alamat
      t.string :kontak

      t.timestamps
    end
  end
end
