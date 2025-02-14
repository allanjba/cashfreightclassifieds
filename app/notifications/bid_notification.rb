# To deliver this notification:
#
# BidNotification.with(post: @post).deliver_later(current_user)
# BidNotification.with(post: @post).deliver(current_user)

class BidNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
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
    params[:message]
  end

  def type
    "Listing"
  end
  #
  def url
    product_path(params[:product])
  end
end
