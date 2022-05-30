class CategoriesController < ApplicationController
  # NOTE: csrfの無効化
  skip_forgery_protection with: :exception, only: [:create, :destroy]

  def index
    @categories = Category.all
    json_response @categories
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.any { render json: {
          :categories => @category
        } }
      end
    else
      respond_to do |format|
        format.any { render json: {
          :errors => [@category.errors]
        } }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: 303
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end

