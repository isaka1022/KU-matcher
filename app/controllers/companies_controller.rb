class CompaniesController < ApplicationController
    def show
        @company = Company.find(params[:id])
        if student_signed_in?
            @currentStudentScroom = Scroom.where(student_id: current_student.id)
            #表示しているCompanyのidとと自分が持っているscroomのidが同じかどうか調べる
            @isRoom = false
            @currentStudentScroom.each do |cs|
                if cs.company_id == @company.id
                    @isRoom = true
                    @scroomId = cs.id
                end
            end
            #共通のRoomがなければ作る
            if @isRoom
            else
                @scroom = Scroom.new
            end
        end
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
