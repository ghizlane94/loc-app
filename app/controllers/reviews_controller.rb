class ReviewsController < ApplicationController

  def index
    @moto = Moto.find(params["moto_id"])
    @reviews = policy_scope(Review.all)

  end

  def new
  end

  def create

    @review = Review.new(review_params)
    @moto = Moto.find(params["moto_id"])
    @review.moto = @moto

    authorize @review

    @review.user_id = current_user.id
    if @review.save
      redirect_to moto_path(@moto)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
