class User < ApplicationRecord
    has_secure_password
    has_many :interactions
    has_many :businesses, through: :interactions
end
