class SessionController < ApplicationController
  skip_before_action :authorized, only: %i[welcome login create]

  def welcome
    redirect_to '/input' if logged_in?
  end

  def login; end

  def create
    user = User.find_by_username(params[:username])

    if user&.authenticate(params[:password])
      cookies.signed[:user_id] = user.id
      redirect_to '/input'
    else
      redirect_to '/login'
    end
  end

  def logout
    cookies.signed[:user_id] = nil
    redirect_to '/welcome'
  end
end
