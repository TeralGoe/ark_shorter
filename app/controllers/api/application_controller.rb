module Api
  # Cm
  class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
  end
end
