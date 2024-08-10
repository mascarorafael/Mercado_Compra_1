class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photos, presence: true

  has_many :orders
  has_many_attached :photos
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
end
