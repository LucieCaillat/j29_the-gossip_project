class User < ApplicationRecord
    belongs_to :city
    has_many :gossips, dependent: :destroy
    has_many :comments
    has_secure_password
    validates :email, 
        presence: true,
        uniqueness: true,
        format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    validates :first_name, presence: true
    validates :last_name, presence:true
    
end
