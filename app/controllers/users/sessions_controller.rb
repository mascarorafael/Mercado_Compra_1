class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, except: [:some_other_action]
  before_action :set_products, only: [:new]
  before_action :authenticate_user!, only: [:destroy]

  private

  def set_products
    @products = Product.where(available: true)
  end
end
