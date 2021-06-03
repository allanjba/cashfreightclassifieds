class UsersController < ApplicationController
    before_action :require_permission, only: [:edit]

    def my_account
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        if current_user.admin?
            @user = User.find(params[:id])
        else
            @user = current_user
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash.now[:notice] = 'Your information was saved successfully.'
            if current_user.admin?
                redirect_to dashboard_users_path, notice: "User's information was saved successfully."
            else
                render :edit
            end
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to dashboard_users_path, notice: 'User was deleted permanently'
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username,:address, :city, :state, :zipcode, :phone, :email, :password, :password_confirmation, :avatar, :admin)
    end

    def require_permission
        unless current_user.id == params[:id].to_i || current_user.admin?
            redirect_to root_path, alert: "You don't have permissions to edit this information"
        end
    end

end
