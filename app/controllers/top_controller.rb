class TopController < ApplicationController
    def index
        @company = Company.find(search_id+1)
        if student_signed_in?
            @student = Student.find(current_student.id)
            @student.count = @student.count + 1
        end
    end

    def update
        
    end


    private
    def search_id
        if params.permitted?
            params.permit(:id)
        else
            1
        end
    end
end

