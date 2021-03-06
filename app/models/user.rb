class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
#end
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
NAME_KANA_REGEX = /\A[ぁ-んァ-ン一-龥]/

validates :nickname, presence: true
validates :password, format: { with: PASSWORD_REGEX }, presence: true
validates :email, presence: true, uniqueness: { case_sensitive: false }
validates :family_name, presence: true, format: { with: NAME_REGEX }
validates :given_name, presence: true, format: { with: NAME_REGEX }
validates :family_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
validates :given_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
validates :birth, presence: true

end