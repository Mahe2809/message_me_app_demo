class SessionController < ApplicationController

    before_action :check_if_present

    def new

    end
    def create
        # byebug
        user = User.find_by(username:params[:session][:username])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Logged In Successfully"
            redirect_to root_path
        else
            flash.now[:error] = "Wrong Credentials (OR) User does not exist"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:error] = "Logged Out!"
        redirect_to login_path
    end

    private

    def check_if_present
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        else
            redirect_to login_path 
        end
    end

end