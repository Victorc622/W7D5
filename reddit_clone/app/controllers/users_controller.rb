class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :index]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors]= @user.errors.full_messages
            render :new
        end
    end

    def index
        @users = User.all
        render :index
    end

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end
end