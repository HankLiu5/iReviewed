class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  # Make methods available to all controllers and views via helper_method
  helper_method :logged_in?, :current_user

  protected
  # Other controller is allowed to inherit as opposed to private scope
    def ensure_login
      # Always go to login page unless session contains reviewer_id
      redirect_to login_path unless session[:reviewer_id]
    end

    def logged_in?
      session[:reviewer_id] #nil is false
    end

    def current_user
      # a || a = b: when a is logically false, a will equal to b.
      @current_user ||= Reviewer.find(session[:reviewer_id])
    end

end
