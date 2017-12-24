class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#唯一無二にする
                
    #emailは小文字の意味            
        before_save { email.downcase! }
    #passwordを隠す    
        has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
