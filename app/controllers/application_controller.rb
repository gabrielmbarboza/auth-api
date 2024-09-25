class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    header = request.headers&.fetch('Authorization', nil)

    begin
      raise StandardError, "The Authorization header is not present" unless header.present?

      token = header.split(' ').last

      decode_data = ::JsonWebToken.decode(token)

      raise StandardError, "This token is invalid" unless decode_data.present?

      user_id = decode_data[0]["user_id"]

      @current_user = User.find(user_id)
    rescue ActiveRecord::RecordNotFound => e
      render json: { message: e.message, status: :unauthorized }, status: 401
    rescue StandardError => e
      render json: { message: e.message, status: :unauthorized }, status: 401
    end
  end
end

