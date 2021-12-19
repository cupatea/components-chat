class DialogsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_dialog, only: [:show]

  def index
    @dialogs = current_user.dialogs
  end

  def show
    @messages = @dialog.messages
    render :show
  end

  def new
    @dialog   = current_user.dialogs.new
    @profiles = Profile.for_new_user_dialog(current_user)
  end

  def create
    @dialog = current_user.dialogs.new(dialog_params)
    if @dialog.save
      redirect_to dialog_path(@dialog), notice: 'Dialog created!'
    else
      @profiles = Profile.for_new_user_dialog(current_user)
      flash.now[:alert] = @dialog.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fetch_dialog
    @dialog = current_user.dialogs.find_by(id: params[:id])

    redirect_to dialogs_path, alert: 'dialog not found' unless @dialog
  end

  def dialog_params
    params.require(:dialog).permit(:profile_id)
  end
end
