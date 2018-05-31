class AddImageToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :image, :string, after: :kontak
  end
end
