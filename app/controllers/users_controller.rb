class UsersController < ApplicationController
    before_action :ensure_user_logged_in, only: [:edit]

    def index
	@users = User.all
    end

    def new
	@user = User.new
    end

    def create

	    @user = User.new(user_params)
    	if @user.save
	        flash[:success] = "Welcome to the site, #{@user.name}"
	        redirect_to @user
    	else
	        flash.now[:danger] = "Unable to create new user"
	        render 'new'
	    end
    end

    def show
	    @user = User.find(params[:id])
        rescue
	    flash[:danger] = "Unable to find user"
	    redirect_to users_path
    end
<<<<<<< HEAD
    
    def edit
        @user = User.find(params[:id])
        rescue
	    flash[:danger] = "Unable to find user"
	    redirect_to users_path
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Profile updated!"
            redirect_to user_path
        else
            flash.now[:danger] = "not able to update!"
            render 'edit'
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "#{@user.name} removed from the site"
        redirect_to users_path
    end
     
    private
    
    def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
