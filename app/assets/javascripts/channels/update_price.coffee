App.update_price = App.cable.subscriptions.create "UpdatePriceChannel",

  connected: ->
    
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data.bid_price
    console.log data.user.username
    unless !data?
      $("#current-price").text(data.bid_price)
      $("#bids-size").text(data.bids_size)

      
    # Called when there's incoming data on the websocket for this channel
