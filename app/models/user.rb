class User < ApplicationRecord
    has_many :interactions
    has_many :businesses, through: :interactions
end
