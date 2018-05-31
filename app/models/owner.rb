class Owner < ApplicationRecord
    
    has_many :lapang
    belongs_to :user, :foreign_key => "id_user"
    
    validates :nama_tempat, presence: true
    validates :alamat, presence: true
    validates :kontak, presence: true
    validates :lat, presence: true
    validates :lang, presence: true

    mount_uploader :image, ImageUploader

end 
