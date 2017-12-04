class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true
    validates :fullname, presence: true

#    has_secure_password(validation: false)

end
