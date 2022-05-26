class CategoriesController < ApplicationController
  # NOTE: csrfの無効化
  skip_forgery_protection with: :exception, only: :create

  def index
    @categories = Category.all
    respond_to do |format|
      format.any { render json: {
        :categories => @categories
      } }
    end
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

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end

