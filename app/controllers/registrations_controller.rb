class RegistrationsController < ApplicationController
  # Sign up page
  def new
    @user = User.new
  end

  # Sign up action
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
