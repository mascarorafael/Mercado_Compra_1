class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def show
        @product = Product.find(params[:id])
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
            p @product.errors.full_messages
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash[:notice] = "#{@product.name} foi atualizado com sucesso."
            redirect_to @product
        else
            flash[:alert] = "#{@product.name} não foi atualizado."
            render :edit
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :quantity)
    end
    
    
    
    # def destroy
    #     @products = Product.find(params[:id])
    #     @products.destroy
    #     flash[:notice] = "Your product '#{@products.name}' has been deleted."
    #     redirect_to show_my_products_path
    # end
    
    
end
