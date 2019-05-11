class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        if student_signed_in?
            students_path
        end
        if company_signed_in?
            company_path(current_company.id)
        end
    end
    def after_sign_out_path_for(resource)
       root_path
    end
end
