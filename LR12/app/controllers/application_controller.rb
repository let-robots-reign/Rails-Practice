class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
