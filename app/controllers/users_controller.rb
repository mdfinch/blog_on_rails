class UsersController < ApplicationController

    def new
        @user = User.new
    end
  
    def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        if @user.save
            flash.delete(:warning)
            redirect_to products_path
        else
            flash[:warning] = "Unable to create new user"
            render :new
        end
    end

end
