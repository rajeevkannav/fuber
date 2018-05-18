class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  skip_before_filter :verify_authenticity_token, if: :json_request?

  private
  def json_request?
    request.format.json?
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
  
end
