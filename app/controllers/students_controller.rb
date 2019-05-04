class StudentsController < ApplicationController
    def show
        @student = Student.find(params[:id])
        
    end

    def edit
    end

    def update
        current_student.update(update_params)
    end


    private
    def update_params
        params.require(:student).permit(:family_name, :family_name_kana, :first_name, :first_name_kana, :avatar)
    end
end
