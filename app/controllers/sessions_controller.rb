class SessionsController < ApplicationController

  def new



  end



  def create

    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in"
      redirect_to home_path

    else
      flash.now[:danger] = "Wrong login information."
      render 'new'

    end

  end



  def destroy

    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path

  end

end