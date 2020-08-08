class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :last_name, :family_name_reading, :last_name_reading, :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: {with: PASSWORD_REGEX}

  validates :family_name, :last_name, format: {with: /\A[あ-んア-ン一-龥]+\z/}
  validates :family_name_reading, :last_name_reading, format: {with: /\A[ア-ン]+\z/}
  
 
end
