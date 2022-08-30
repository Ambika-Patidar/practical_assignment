class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable

  validates :email, format: { with: /\A([\w\'\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, uniqueness: true

  enum roles: { '0': 'admin', '1': 'user' }

  has_many :favorites
  has_many :books, through: :favorites

  validates :email, format: { with: /\A([\w\'\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
