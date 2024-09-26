module Api
  module V1 
    class UsersSerializer < ApplicationSerializer
      def json
        super(json_fields)
      end

      private

      def json_fields
        {
          only: %i[id username email avatar]
        }
      end
    end
  end
end