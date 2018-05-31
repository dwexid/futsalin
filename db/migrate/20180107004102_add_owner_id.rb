class AddOwnerId < ActiveRecord::Migration[5.1]
  def change
    add_column :jadwals, :id_owner, :integer, after: :id
  end
end
