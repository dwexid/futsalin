class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string, after: :username
    add_column :users, :kontak, :string, after: :fullname
    add_column :users, :alamat, :string, after: :kontak
    add_column :users, :jk, :string, after: :fullname
    add_column :users, :ttl, :string, after: :fullname
  end
end
