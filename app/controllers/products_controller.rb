class ProductsController < ApplicationController
  def index
    @products = Product.where(available: true)
  end

  def show
    @product = Product.find(params[:id])
    if current_user
      @already_purchased = current_user.orders.where(product_id: @product.id).exists?
    else
      @already_purchased = false
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product) # Redireciona para a página de show do produto
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      Rails.logger.debug { "Fotos atualizadas: #{@product.photos.map(&:key).inspect}" }
      flash[:notice] = "#{@product.name} foi atualizado com sucesso."
      redirect_to @product
    else
      flash[:alert] = "#{@product.name} não foi atualizado."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "O produto '#{@product.name}' foi excluído com sucesso."
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, photos: [])
  end
end
