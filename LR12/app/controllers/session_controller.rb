class SessionController < ApplicationController
  skip_before_action :authorized, only: %i[welcome login create]

  def welcome
    if logged_in?
      redirect_to '/input'
    end
  end

  def login
  end

  def create
    user = User.find_by_username(params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/input'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
