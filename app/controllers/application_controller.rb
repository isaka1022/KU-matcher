class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        if student_signed_in?
            students_path
        end
    end
end
