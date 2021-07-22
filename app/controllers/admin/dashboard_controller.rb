class Admin::DashboardController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  def show
  end
end
