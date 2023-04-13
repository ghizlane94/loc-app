class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.moto_id = params["moto_id"]
    @moto = Moto.find(params["moto_id"])

    if @review.save

      respond_to do |format|
        format.html { redirect_to moto_reviews_path(@review.moto_id), notice: 'review was successfully created.' }
        format.text { render partial: "motos/reviews", locals: { moto: @moto }, formats: [:html] }
      end
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :moto_id)
  end

end
