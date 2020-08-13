class User < ApplicationRecord
    has_many :stories
    has_secure_password
    validates :email, uniqueness: true
end
