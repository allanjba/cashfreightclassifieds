class MylistingsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @products = current_user.products
      @title = "My Buy It Now Ads"
      @title2 = "My Auctions"
      render 'products/index'
    end
  
  end
  