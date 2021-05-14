class NotificationsController < ApplicationController

    def read 
        @notification = current_user.notifications.find(params[:id])
        
        respond_to do |format|
            if @notification.mark_as_read!
                format.js
            end
        end
    end

end