class ReviewsController < ApplicationController
before_action :set_review, only: %i[edit update destroy]

  def index
    @moto = Moto.find(params[:moto_id])
    @reviews = policy_scope(@moto.reviews)
    @average_rating = @moto.reviews.any? ? @moto.reviews.average(:rating).to_i : nil
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

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to moto_path(@review.moto), notice: "Review was successfully updated."
    else
      render :edit
    end
  end


  def destroy
    @review.destroy
    authorize @review
    redirect_to moto_path(@review.moto), notice: "Review was successfully deleted.", status: :see_other

  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
