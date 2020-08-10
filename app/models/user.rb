class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
   validates :nickname
   validates :family_name
   validates :last_name
   validates :family_name_reading
   validates :last_name_reading
   validates :birthday
  end

  with_options format: {with: /\A[あ-んア-ン一-龥]+\z/, message: 'Full-width characters'} do
    validates :family_name
    validates :last_name
  end

  with_options format: {with: /\A[ア-ン]+\z/, message: 'Full-width katakana characters'} do
    validates :family_name_reading
    validates :last_name_reading
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }

end
