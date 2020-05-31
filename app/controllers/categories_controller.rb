class CategoriesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :load_category]
  skip_before_action :authorized_admin
  def index
    @categories = Category.all
  end

  def show
    load_category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to @category
  end

  def edit
    load_category
  end

  def update
    load_category
    @category.update(category_params)
    redirect_to :category
  end

  def delete
    load_category
    @category.destroy
    redirect_to :categories
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def load_category
    @category = Category.find(params[:category_id])
  end
end
