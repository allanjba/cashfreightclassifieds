class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def update
    @product = Product.find(params[:product])
    favorite = Favorite.where(product: @product, user: current_user)
    if favorite == []
      # create favorite
      Favorite.create(product: Product.find(params[:product]), user: current_user)
      FavoritedNotification.with({product: @product, user: current_user}).deliver_later(@product.user)
    else
      # delete favorite
      favorite.destroy_all
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end

  end

end
