class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def index
  end

  def create
    @user = User.create( user_params )
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/events'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.update(params[:id], user_params )
    redirect_to '/events'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
