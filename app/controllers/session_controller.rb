class SessionController < ApplicationController

    def new

    end
    def create
        # byebug
        user = User.find_by(username:params[:session][:username])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged In Successfully"
            redirect_to root_path
        else
            flash.now[:alert] = "Wrong Credentials (OR) User does not exist"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out!"
        redirect_to login_path
    end

end