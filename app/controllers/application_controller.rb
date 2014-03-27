class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    # ...
	
  helper_method :date_loaded
  def date_loaded
	     return Time.now.strftime("%B %d, %Y")
  end

  def increment_count
      session[:counter] ||= 0
      session[:counter] += 1
      if session[:counter] > 5
        return session[:counter]         
      end
  end
  
  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
