class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: "Avaliação enviada com sucesso!"
    else
      flash.now[:alert] = "Não foi possível enviar a avaliação."
      render "products/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
