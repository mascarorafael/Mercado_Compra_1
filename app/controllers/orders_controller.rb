class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.joins(:product).where(products: { available: false }).distinct
    Rails.logger.debug("Entered the new action")
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

    Rails.logger.debug "Order Params: #{order_params.inspect}"
    Rails.logger.debug "Order Before Save: #{@order.inspect}"

    if @order.save
      @product.update(available: false)
      Rails.logger.debug "Order Saved Successfully: #{@order.inspect}"
      redirect_to order_path(@order), notice: "Pedido criado com sucesso!"
    else
      Rails.logger.debug "Order Errors: #{@order.errors.full_messages.inspect}"
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
