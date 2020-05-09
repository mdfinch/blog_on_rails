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
        @user = current_user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
            redirect_to posts_path
        else
            render :edit
        end
    end

    def edit_password
        @user = User.find(params[:id])
    end

    def update_password
        @user = current_user
        user_params = params[:user]
        if (current_user.authenticate(user_params[:current_password])) # authenticate same password
            if (user_params[:new_password] == user_params[:new_password_confirmation]) # check if new password and confirmation are same
                    # @user.password = user_params[:new_password]
                    # if @user.update({password_digest: @user.password_digest})
                if @user.update({password: user_params[:new_password]})
                    # because of has_secure_password adding a password attribute to a user will automatically update and hash a password_digest attribute
                    # has_secure_password will also have a validation to make sure the attributes `password` and `password_digest` are the same
                    flash[:success] = "password updated"
                    redirect_to posts_path
                else
                    flash[:danger] = "password not updated"
                    render :edit_password
                end

            else
                flash[:danger] = "password not updated"
            end
        end
    end

end
