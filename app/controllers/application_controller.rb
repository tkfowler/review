class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to '/' if session[:user_id] == nil
  end
  def require_correct_user
    user = User.find(params[:id])
    binding.pry
    redirect_to "/users/#{current_user.id}" if current_user != user
  end
end
