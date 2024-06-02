class AuthenticationController < ApplicationController

  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
  def register
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, SECRET_KEY, 'HS256')
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
