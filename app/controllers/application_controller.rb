class ApplicationController < ActionController::Base



    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :address, :city, :state, :zipcode, :phone, :email, :password, :password_confirmation, :avatar])
    end

    def favorite_text(product)
        if user_signed_in? 
            return current_user.favorited?(product) ?  "Saved" : " Watch List"
        else
            " Watch List"
        end
    end

    def saved_class(product)
        if user_signed_in? 
            return current_user.favorited?(product) ?  "saved" : ""
        end
    end

    def sender_class(receipt, user)
        if receipt.id == user.id
          "room_owner"
        else
          "room_user"
        end
    end

    # **args wil transform arguments into hash
    # Expects user and size key
    def user_avatar **args
        user = args[:user]
        size = 150 # defaultt size
        size = args[:size] if args.has_key?(:size) # overwrite size if key is passed
        if user.avatar.attached?
            user.avatar.variant(combine_options: { resize: "#{size}x#{size}^", extent: "#{size}x#{size}", gravity: 'center' }).processed
        else 
            # needs to call asset_path from action controller
            ActionController::Base.helpers.asset_path('userImage.png')
        end
    end

    def message_unread_size
        if current_user && current_user.notifications.where(type: 'MessageNotification').unread.any?
            current_user.notifications.where(type: 'MessageNotification').unread.size
        else
            0
        end
    end
    def notification_unread_size
        if current_user && current_user.notifications.where.not(type: 'MessageNotification').unread.any?
            current_user && current_user.notifications.where.not(type: 'MessageNotification').unread.size
        else
            0
        end
    end

    helper_method :favorite_text, :saved_class, :sender_class, :conversation_exists?, :user_avatar, :notification_unread_size, :message_unread_size
end
