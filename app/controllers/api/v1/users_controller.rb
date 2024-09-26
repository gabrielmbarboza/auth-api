module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: UsersSerializer.new(User.all).json
      end
    end
  end
end
