class CompaniesController < ApplicationController
    def show
        @company = Company.find(params[:id])
        @room_id = message_room_id(current_student,@company)
        @messages = Message.recent_in_room(@room_id)
    end

    def edit
    end

    def update
        current_company.update(update_params)
    end

    def message_room_id(student, company)
        "#{student.id}-#{company.id}"
    end

    private
    def update_params
        params.require(:company).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :avatar)
    end
end
