class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: current_user, status: :ok
    else
      render json: "Email or password is invalid", status: :bad_request
    end
  end

  def destroy
    session[:user_id] = nil
    render json: "Logged out!", status: :ok
  end
end
