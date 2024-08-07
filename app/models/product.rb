class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
end
