class NotificationsController < ApplicationController

    def index
        @notifications = current_user.notifications
        
    end

    def nav_show
        respond_to do |format|
            format.js
        end
    end

    def read 
        @notification = current_user.notifications.find(params[:id])
        @notificationSize = current_user.notifications.where.not(type: 'MessageNotification').unread.size - 1
        
        respond_to do |format|
            if @notification.mark_as_read!
                format.js
            end
        end
    end

end