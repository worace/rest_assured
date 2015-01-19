class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception do |exception|
    Rails.logger.error("********* EXCEPTION RAISED: #{exception.message} *************")
    Rails.logger.error(exception.backtrace.join("\n"))
    raise exception
  end
end
