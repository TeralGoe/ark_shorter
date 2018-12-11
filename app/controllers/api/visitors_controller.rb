module Api
  # Cm
  class VisitorsController < ActionController::API
    include Response
    include ExceptionHandler

    def index
      @visitors = Visitor.all
      json_response(@visitors)
    end
  end
end
