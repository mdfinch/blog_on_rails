class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true 
    validates :email, presence: true, uniqueness: true,
    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
    has_many :posts
    has_many :comments

    def full_name
        "#{first_name}".strip.capitalize! + " " +"#{last_name}".strip.capitalize!
    end
end
