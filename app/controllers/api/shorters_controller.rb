module Api
  # Cm
  class ShortersController < ApplicationController
    def index
      @shorters = Shorter.all
      json_response(@shorters)
    end
  end
end
