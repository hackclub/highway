class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticated?
      current_user.present?
    end

    def require_authentication
      unless authenticated?
        redirect_to root_path, alert: "You must be signed in to access this page."
      end
    end
end
