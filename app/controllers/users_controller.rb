class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            flash.now[:notice] = 'Your information was saved successfully'
            render :edit
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username,:adress, :city, :state, :zipcode, :phone, :email, :password, :password_confirmation, :avatar)
    end


end
