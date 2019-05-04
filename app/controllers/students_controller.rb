class StudentsController < ApplicationController
    def show
        @student = Student.find(params[:id])
        @room_id = message_room_id(current_student,@company)
        @messages = Messages.recent_in_room(room_id)
    end

    def edit
    end

    def update
        current_student.update(update_params)
    end

    def message_room_id(student, company)
        "#{student.id}-#{company.id}"
    end

    private
    def update_params
        params.require(:student).permit(:family_name, :family_name_kana, :first_name, :first_name_kana, :avatar)
    end
end
