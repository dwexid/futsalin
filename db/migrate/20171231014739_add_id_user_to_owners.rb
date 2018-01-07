class AddIdUserToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :id_user, :integer, after: :id
  end
end
