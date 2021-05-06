App.update_price = App.cable.subscriptions.create "UpdatePriceChannel",

  connected: ->
    
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless !data?
      $(".product-price[data-product-id=#{data.product_id}]").text("$#{data.bid_price}")
      $(".product-price[data-product-id=#{data.product_id}]").effect("highlight", { color: "#fdff65" }, 1000);
      $(".bids-size[data-product-id=#{data.product_id}]").text(data.bids_size)

    if data.user_id == $("div[data-user-id]").data("userId")
      $(".display-bid-form[data-product-id=#{data.product_id}]").hide()
      $(".highest-bidder[data-product-id=#{data.product_id}]").show()
    else
      # price = parseInt(data.bid_price) + 1
      $(".display-bid-form[data-product-id=#{data.product_id}]").show()
      $("#bid_bid_price[data-product-id=#{data.product_id}]").val(data.price_plus)
      $(".highest-bidder[data-product-id=#{data.product_id}]").hide()


      

      
    # Called when there's incoming data on the websocket for this channel
