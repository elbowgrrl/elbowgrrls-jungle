class Admin::CategoriesController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end  

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
