class Api::V1::UsersController < ApplicationController
  before_action :user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end
