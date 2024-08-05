class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
end
