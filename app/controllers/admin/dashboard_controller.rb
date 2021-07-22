class Admin::DashboardController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @count_products = Product.select("created_at").count
    @count_categories = Category.select("created_at").count
  end
end
