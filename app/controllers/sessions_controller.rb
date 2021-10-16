class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Logged in successfully'
    else
    # If user's login doesn't work, send them back to the login form.
      # flash.now[:alert] = 'Invalid email or password'
      redirect_to '/login'
    end
  end

  def destroy
    # session.delete(:user_id)
    session[:user_id] = nil # leave :user_id key in the session hash, destroy the key & value, as if your session never had any value assigned to that key.
    redirect_to '/login', notice: 'Logged Out'
  end
end