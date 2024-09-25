class SessionsController < ApplicationController
  skip_before_action :authenticate

  def login
    token = ::AuthService.new(email: params[:email], password: params[:password]).call

    if token.present?
      render json: { token: token }
    else
      render json: { error: "Invalid credentials" }, status: 401
    end
  end

  def signup
    user = User.new(user_params)

    if user.save
      token = ::JsonWebToken.encode({ user_id: user.id })

      render json: { token: token }
    else
      render json: { message: "Cannot create your profile" }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end