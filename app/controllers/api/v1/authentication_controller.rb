module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenicationError < StandardError; end
      rescue_from ActionController::ParameterMissing, with: :parameter_:missing
      rescue_from AuthenicationError, with: :handle_unauthenticated
      def create
        if user
          raise AuthenicationError unless user.authenticate(params.require(:password))
          render json UserRepresenter.new(user).as_json, status: :created
        else
          render json: { error: "No such user"}
        end
      end

      private
      def user
        @user ||= User.find_by(username: params.require(:username))
      end

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        render json: { error: "Incorrect password"}, status: :unauthorized
      end
    end
  end
end

