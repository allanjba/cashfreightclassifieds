class WatchlistController < ApplicationController
  before_action :authenticate_user!

  def index
    products = []
    current_user.favorites.each do |favorite|
      products << favorite.product
    end
    @products = products
    @title = "My Watch List"
    render 'products/index'
  end

end
