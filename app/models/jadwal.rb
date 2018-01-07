class Jadwal < ApplicationRecord
    belongs_to :lapang, :foreign_key => "id_lapang"
    belongs_to :user, :foreign_key => "id_user"
end
