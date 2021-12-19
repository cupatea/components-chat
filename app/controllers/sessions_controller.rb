class SessionsController < ApplicationController
  # Log in page
  def new; end

  # Log in action
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  # Log out action
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end
