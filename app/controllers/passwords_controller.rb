class PasswordsController < ApplicationController
  before_action :authenticate_user!

  # Change password page
  def edit; end

  # Change password action
  def update
    if current_user.update(password_params)
      redirect_to root_path, notice: 'Password Updated'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
