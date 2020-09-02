class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers'}
  
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :birth
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'} do
      validates :first_name
      validates :name
    end
    
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
      validates :first_name_reading
      validates :name_reading
    end
  end
end
