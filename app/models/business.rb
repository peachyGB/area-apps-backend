class Business < ApplicationRecord
    has_many :interactions
    has_many :users, through: :interactions
end
