class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.joins(:product).where(products: { available: false }).distinct
  end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = @product.price
    @order.product = @product
    if @order.save
      @product.update(available: false)
      redirect_to order_path(@order), notice: "Pedido criado com sucesso!"
    else
      flash.now[:alert] = "Não foi possível criar o pedido."
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :total_price)
  end
end
