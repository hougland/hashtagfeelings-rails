class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if !auth_hash["uid"].nil?
      @user = User.find_or_create_from_omniauth(auth_hash)
      if !@user.nil?
        session[:user_id] = @user.id
        flash[:notice] = "You're logged in!"
        redirect_to root_path
      else
        flash[:error] = "Failed to save the user"
        redirect_to root_path
      end
    else
      flash[:error] = "Whoops, authentication failed. try again!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    flash[:notice] = "You're logged out!"
    redirect_to root_path
  end
end
