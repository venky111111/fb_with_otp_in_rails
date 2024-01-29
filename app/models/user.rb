class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post
  has_many :postcomments
  has_many :likes, as: :likeable
  has_one :otpsetup, dependent: :destroy
  validates :phonenumber, presence: true, length: { minimum: 10, maximum: 15 }
  validates :gender, inclusion: { in: ['male', 'female', 'other'], allow_nil: true }
  def self.ransackable_associations(auth_object = nil)
    ["likes", "otp", "post", "postcomments"]
  end
    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "gender", "id", "id_value", "name", "phone_number_verified", "phonenumber", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  


 
end
