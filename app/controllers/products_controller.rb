class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.where(available: true)
  end

  def show
    @already_purchased = current_user.orders.where(product_id: @product.id).exists? if user_signed_in?
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    # @product is set by before_action :set_product
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "#{@product.name} foi atualizado com sucesso."
      redirect_to @product
    else
      flash[:alert] = "#{@product.name} não foi atualizado."
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "O produto '#{@product.name}' foi excluído com sucesso."
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize_user
    unless current_user == @product.user
      flash[:alert] = "Você não tem permissão para realizar essa ação."
      redirect_to products_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, photos: [])
  end
end
