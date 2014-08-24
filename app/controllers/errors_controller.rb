class ErrorsController < ApplicationController
  def routing_error
    raise ActionController::RoutingError,
      "No route maches #{request.path.inspect}"
  end
end
