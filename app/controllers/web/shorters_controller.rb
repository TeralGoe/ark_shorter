module Web
  # Cm
  class ShortersController < ApplicationController
    require 'geocoder'

    def new
      @shorter = Shorter.new
    end

    def create
      shorter = Shorter.new(shorter_params)
      duplicate = shorter.check_for_duplicates
      return render template: 'web/shorters/edit', locals: { shorter: duplicate } if duplicate.present?

      if shorter.save
        render template: 'web/shorters/edit', locals: { shorter: shorter }
      else
        redirect_to root_path, flash: { error: t('.error') }
      end
    end

    def show; end

    def edit; end

    private

      def shorter_params
        params.require(:shorter).permit(:original_url)
      end
  end
end
