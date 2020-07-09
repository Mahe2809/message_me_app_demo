class User < ApplicationRecord
    validates :username, presence: true, length: {minimum: 6,maximum: 50},
    uniqueness: { case_sensitive: false }

    has_many :messages
    has_secure_password
    
end