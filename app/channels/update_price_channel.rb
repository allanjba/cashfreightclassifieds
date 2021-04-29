class UpdatePriceChannel < ApplicationCable::Channel


  def subscribed
    stream_from "update_price_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
