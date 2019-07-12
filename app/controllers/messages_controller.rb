class MessagesController < ApplicationController

  before_action :redirect_index, :except => [:index]

  def index
    @messages = Message.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new

  end

  def create
    Message.create(text: message_params[:text],user_id: current_user.id)
  end

  private
  def message_params
    params.permit(:text)
  end

  def redirect_index
    redirect_to :action => "index" unless user_signed_in?
  end

end
