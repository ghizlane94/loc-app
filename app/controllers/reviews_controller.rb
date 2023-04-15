class ReviewsController < ApplicationController

  def index
    @moto = Moto.find(params[:moto_id])
    @reviews = policy_scope(Review.all)

  end

  def new
    # @moto = Moto.find(params[:moto_id])
    # @review = Review.new
    # redirect_to moto_path(@moto)
  end

  def create

    @review = Review.new(review_params)
    @moto = Moto.find(params[:moto_id])
    @review.moto = @moto

    authorize @review

    @review.user_id = current_user.id
    if @review.save
      redirect_to moto_path(@moto)
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to moto_path(@review.moto), status: :see_other

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
