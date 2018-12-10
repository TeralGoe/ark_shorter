module Api
  # Cm
  class ShortersController < ApplicationController
    def index
      @shorters = Shorter.all
      json_response(@shorters)
    end

    def create
      duplicate = Shorter.new(shorter_params).check_for_duplicates
      return json_response(duplicate, :created) if duplicate.present?

      @shorter = Shorter.create!(shorter_params)
      json_response(@shorter, :created)
    end

    private

      def shorter_params
        params.require(:shorter).permit(:original_url)
      end
  end
end
