class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	def index
		@review  = Review.all.order("name ASC")
	end

	def show
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to @review
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to @review, notice: "Successfully deleted review"
	end

	private

		def category_params
			params.require(:review).permit(:criteria)
		end
		def find_review
			@review = Review.find(params[:id])
		end
end
