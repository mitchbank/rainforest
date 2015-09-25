class ReviewsController < ApplicationController
	before_filter :load_product
	before_filter :ensure_logged_in, only: [:create, :destroy]
  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user
    respond_to do |format|
    	if @review.save
    		format.html { redirect_to products_path, notice: "Review created successfully!" }
        format.js {}
    	else
    		format.html {render 'products/show'}
        format.js {}
      end
  	end
  end

  def edit
    @review = @product.reviews.find_by(id: params[:id])
  end

  def update
    @review = @product.reviews.find_by(id: params[:id])

    if @review.update_attributes(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
  	@review = Review.find(params[:id])    

    respond_to do |format|
      if @review.destroy
        format.html { redirect_to product_path(@product), notice: "Your review was successfully destroyed. Nobody will ever see your internet angst." }
        format.js {}
      else
        format.html { render 'products/show' }
        format.js {}
      end
    end
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
