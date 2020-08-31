class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true ,uniqueness: true
  validates :first_name, :name, :birth, presence: true
  validates :first_name, presence: { message: 'Full-width characters'}
  validates :name, presence: { message: 'Full-width characters'}

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers'}
  
  # with_optionsでdo~end内にpresence:trueを一括で設ける
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
    # withはカタカナの正規表現
    validates :first_name_reading
    validates :name_reading
  end
end
