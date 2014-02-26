class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  def authorize
    logger.info "***controller: #{params[:controller]}***"
    logger.info "***action: #{params[:action]}***"

    if (params[:action] != "new") && (params[:controller] != "sessions")
      if current_user.nil?
        redirect_to root_url, notice: "Please sign in!"
      end
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]\
    end

    helper_method :current_user
end
