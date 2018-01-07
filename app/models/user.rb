class User < ApplicationRecord
    
    has_many :owner
    
    validates :username, presence: true
    validates :password, presence: true
    validates :fullname, presence: true
    validates :status, presence: true

    has_secure_password

end
