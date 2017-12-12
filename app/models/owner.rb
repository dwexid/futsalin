class Owner < ApplicationRecord
     validates :username, presence: true
     validates :password, presence: true
     validates :nama_tempat, presence: true
     validates :alamat, presence: true
     validates :kontak, presence: true

     
     has_secure_password
end
