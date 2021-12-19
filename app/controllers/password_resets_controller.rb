class PasswordResetsController < ApplicationController
  # Show reset password form
  def new; end

  # Send reset password email
  def create
    @user = User.find_by(email: params[:email])

    UserMailer.with(user: @user).reset_password_email.deliver_later if @user.present?

    redirect_to root_path, notice: 'Please check your email to reset the password'
  end

  # Finds user with a valid token
  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_session_path, alert: 'Your token has expired. Please try again.'
  end

  # Updates user's password
  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to new_session_path, notice: 'Your password was reset successfully. Please sign in'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
