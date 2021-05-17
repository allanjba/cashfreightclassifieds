class BidsController < ApplicationController
    before_action :authenticate_user!, only: %i[:create]

    def create
        @bid = Bid.new(bid_params)
        @bid.user = current_user
        respond_to do |format|
            if @bid.save
                format.html { redirect_to dashboard_categories_path, notice: 'Your bid was placed.' }
                format.json { render :show, status: :created, location: @bid }
                format.js
                @bid.product.update(last_bid_id: @bid.id)
                # Notifications and broadcast
                send_notification(@bid)
                ActionCable.server.broadcast 'update_price_channel',
                                   bid_price:   @bid.price,
                                   price_plus:  @bid.price_plus(1),
                                   user_id:        @bid.user.id,
                                   product_id:  @bid.product.id,
                                   bids_size:   @bid.product.bids.size + 1
                
            else
                format.html { render :new }
                format.json { render json: @bid.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bid_params
      params.require(:bid).permit(:product_id, :bid_price, :auto_bid, :auto_bid_increment, :auto_bid_max_price)
    end

    def send_notification bid

        case bid.product.bids.size
        when 1
            BidNotification.with({
                message: "People started bidding on your Listing", 
                product: bid.product.id, 
                user: current_user
                }).deliver_later(bid.product.user)
        when 5
            BidNotification.with({
                message: "Your listing is already has 5 bids", 
                product: bid.product.id, 
                user: current_user
                }).deliver_later(bid.product.user)
        when 50
            BidNotification.with({
                message: "Your listing is popular! More than 50 bids", 
                product: bid.product.id, 
                user: current_user
                }).deliver_later(bid.product.user)
        else
            # do nothing
        end
    end

end