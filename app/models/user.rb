class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        VALID_PASSSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

         validates :email, presence: true, length: { maximum: 255},
                                           format: {with: VALID_EMAIL_REGEX },
                                           uniqueness: { case_sensitive: false }
         validates :encrypted_password, presence: true, length: { minimum: 7 }
         validates :password, presence: true, length: { minimum: 7 },
                                              format: User::VALID_PASSSWORD_REGEX,
                                              allow_blank: true
         validates :nickname, presence: true
         with_options presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]/ } do
         validates :last_name
         validates :first_name
         end
         with_options presence: true, format: {with: /\A[ァ-ヶーー]+\z/ } do
         validates :last_name_kana
         validates :first_name_kana
         end
         validates :birth_date, presence: true
         
         has_many :items
         has_many :orders
end
