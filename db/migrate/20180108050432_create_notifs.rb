class CreateNotifs < ActiveRecord::Migration[5.1]
  def change
    create_table :notifs do |t|
      t.integer :id_user
      t.string :isi
      t.integer :status

      t.timestamps
    end
  end
end
