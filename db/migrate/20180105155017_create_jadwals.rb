class CreateJadwals < ActiveRecord::Migration[5.1]
  def change
    create_table :jadwals do |t|
      t.integer :id_lapang
      t.integer :id_user
      t.date :tgl
      t.integer :beg_time
      t.integer :end_time

      t.timestamps
    end
  end
end
