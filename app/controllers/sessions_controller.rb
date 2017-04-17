class SessionsController < ApplicationController

  def login_form; end

  def login
    # raise
    user = User.find_by_name(params[:username])
    if user
      session[:user_id] = user.id
      flash[:success] = "Found that user!"
      redirect_to :root
    else
      flash.now[:failure] = "Unable to find that user."
      render :login_form
    end
  end
end
