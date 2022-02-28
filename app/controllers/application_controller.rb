class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
  before_action :require_user
    def current_user
        current_user_id = session[:student_id]
        @current_user_data ||= Student.find(current_user_id) if current_user_id
        return  @current_user_data
    end

    def logged_in?
        !!current_user
    end
    def require_user
        if !logged_in?
            flash[:alert] = "You must be login to perform this action"
            redirect_to login_path
        end
    end
end
