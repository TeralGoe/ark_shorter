module Api
  # Cm
  class ShortersController < ActionController::API
    include Response
    include ExceptionHandler

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

    def show
      @shorter = Shorter.find_by!(code: params[:code])
      json_response(@shorter)
    end

    private

      def shorter_params
        params.require(:shorter).permit(:original_url)
      end
  end
end
