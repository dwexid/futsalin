class AddStatusToJadwal < ActiveRecord::Migration[5.1]
  def change
    add_column :jadwals, :status, :integer, after: :end_time
  end
end
