class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :address, :city, :state, :zipcode, :phone, :email, :password, :password_confirmation, :avatar])
    end

    def favorite_text(product)
        return current_user.favorited?(product) ?  "Saved" : " Watch List"
    end

    def saved_class(product)
        return current_user.favorited?(product) ?  "saved" : ""
    end



    helper_method :favorite_text, :saved_class
end
