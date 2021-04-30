App.update_price = App.cable.subscriptions.create "UpdatePriceChannel",

  connected: ->
    
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless !data?
      $("#current-price").text(data.bid_price)
      $("#bids-size").text(data.bids_size)

    if data.owner
      $("#bid-form").hide()
      $("#highest-bidder").text("You are the highest bidder")
      $("#highest-bidder").show()
    else
      # price = parseInt(data.bid_price) + 1
      $("#bid-form").show()
      $("#bid_bid_price").val(data.price_plus)
      $("#highest-bidder").hide()

      

      
    # Called when there's incoming data on the websocket for this channel
