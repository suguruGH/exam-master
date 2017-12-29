module SessionsHelper
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) # ||= はnilかfalseの意味
    end
    
    def logged_in?
      !current_user.nil?
    end
end
