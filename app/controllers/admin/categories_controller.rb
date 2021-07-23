class Admin::CategoriesController < ApplicationController

  def index
    @admin_category = Category.order(id: :desc).all
  end

def create
end

def new
end  

end
