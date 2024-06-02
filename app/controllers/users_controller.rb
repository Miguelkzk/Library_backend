class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.details, status: :unprocessable_entity
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
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.details, status: :unprocessable_entity
    end
  end
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.permit(:name, :username, :password)
  end
end
