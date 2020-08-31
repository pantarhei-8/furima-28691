class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :name, :birth, presence: true
  validates :first_name, presence: { message: 'Full-width characters'}
  validates :name, presence: { message: 'Full-width characters'}
  validates :password, presence: { message: 'Include both letters and numbers'}
  
  # with_optionsでdo~end内にpresence:trueを一括で設ける
  with_options presence: true do
    # withはカタカナの正規表現
    validates :first_name_reading, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters'}
    validates :name_reading, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters'}
  end
    





end
