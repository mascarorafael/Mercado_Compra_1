class Users::SessionsController < Devise::SessionsController
  before_action :set_products, only: [:new]

  private

  def set_products
    @products = Product.where(available: true)
  end
end
