class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true,
    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
    has_many :posts
    has_many :comments
end
