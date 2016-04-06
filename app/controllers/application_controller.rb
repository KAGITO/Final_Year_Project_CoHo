class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token 
  include SessionsHelper

   private
 def current_thirduser
    @current_thirduser ||= Thirduser.find(session[:thirduser_id]) if session[:thirduser_id]
  end

  helper_method :current_thirduser


    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
