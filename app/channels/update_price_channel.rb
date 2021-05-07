class UpdatePriceChannel < ApplicationCable::Channel


  def subscribed
    stream_from "update_price_channel"
    stream_from "update_price_channel_user_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
