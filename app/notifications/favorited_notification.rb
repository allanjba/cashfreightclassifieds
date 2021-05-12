# To deliver this notification:
#
# FavoritedNotification.with(post: @post).deliver_later(current_user)
# FavoritedNotification.with(post: @post).deliver(current_user)

class FavoritedNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #

  def user
    params[:user]
  end

  def message
    "favorited your" 
  end

  def type
    "Product"
  end
  #
  def url
    product_path(params[:product])
  end
end
