class ReviewsController < ApplicationController
  before_action :find_user
  def index
    @reviews = Review.all
  end

  def show
    @review = current_user.review.find_by(id: params[:id])

  end

  def new
    @review = Review.new
  end

  def create
    @review = @user.reviews.build(review_params)
    @review.save
    redirect_to review_path(@review)

  end

  def edit
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to edit_users_review_path unless @review
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to profile_path
  end

  private

  def find_user
    @user = current_user
  end
    def review_params
    params.require(:review).permit(:description)
  end
end
