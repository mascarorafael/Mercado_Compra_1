class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :total_price, presence: true
  validates :product_id, presence: true
  validates :user_id, presence: true
end
