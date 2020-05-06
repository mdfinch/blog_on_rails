class UsersController < ApplicationController

    def new
        @user = User.new
    end
  
    def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        if @user.save
            flash.delete(:warning)
            redirect_to posts_path
        else
            flash[:warning] = "Unable to create new user"
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
            redirect_to posts_path
        else
            render :edit
        end
    end

    private

end
