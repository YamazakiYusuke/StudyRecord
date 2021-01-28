class User < ApplicationRecord
  has_many :study_times, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  before_validation { email.downcase! }

end
