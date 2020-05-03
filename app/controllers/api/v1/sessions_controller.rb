class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      @current_user = user
      session[:user_id] = user.id
      render json: @current_user, status: :ok
    else
      render json: { message: "Email or password is invalid" }, status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    render json: "Logged out!", status: :ok
  end
end
