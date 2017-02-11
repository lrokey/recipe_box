class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :edit, :update, :destroy]
	def index
		@category  = Category.all.order("name ASC")
	end

	def show
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to @category
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		redirect_to @category, notice: "Successfully deleted category"
	end

	private

		def category_params
			params.require(:category).permit(:name)
		end
		def find_category
			@category = Category.friendly.find(params[:id])
		end

end
