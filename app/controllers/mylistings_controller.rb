class MylistingsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @products = current_user.products
      @title = "My Listings"
      render 'products/index'
    end
  
  end
  