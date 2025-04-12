class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find[:params]
  end

  def create
    @category= Category.new(categories_params)
    if @category.save
      redirect_to(categories_path)
    elsif @category.errors.present?
      render(new)
    end
  end

  def new
    @category= Category.new
  end

  def edit
    @category = Category.find[:params]
  end

  def delete
    @object=Class.find(id)
    @object.destroy
    redirect_to(categories_path)
  end

  private

  def categories_params
    params.require(categories).permit(:name, :position)
  end
end
