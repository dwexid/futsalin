class Lapang < ApplicationRecord

    validates :id_owner, presence: true
    validates :nama_lapang, presence: true
    validates :harga_perjam, presence: true
    validates :jenis, presence: true
    validates :image, presence: true

    has_many :jadwal
    belongs_to :owner, :foreign_key => "id_owner"
    mount_uploader :image, ImageUploader

end
