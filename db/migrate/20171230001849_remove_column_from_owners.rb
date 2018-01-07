class RemoveColumnFromOwners < ActiveRecord::Migration[5.1]
  def change
    remove_column :owners, :username
    remove_column :owners, :digest_password
  end
end
