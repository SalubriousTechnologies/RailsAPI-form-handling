class ApplicationController < ActionController::API
	include ApplicationHelper
	
	rescue_from ActiveRecord::InvalidForeignKey, with: :render_not_found_response
	
	def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
