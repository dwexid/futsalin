class AddColumnToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :username, :string, :after => :id
    add_column :owners, :digest_password, :string, :after => :username
  end
end
