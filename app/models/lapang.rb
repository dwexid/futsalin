class Lapang < ApplicationRecord

    has_many :jadwal
    #belongs_to :owner, :foreign_key => "id_owner"
    mount_uploader :image, ImageUploader

end
