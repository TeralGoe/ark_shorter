module Api
  # Cm
  class VisitorsController < ApplicationController
    def index
      @visitors = Visitor.all
      json_response(@visitors)
    end
  end
end
