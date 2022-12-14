class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :description, presence: true
end
