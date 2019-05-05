class StudentsController < ApplicationController
    def index
        @company = Company.find(search_id)
    end

    def show
        @student = Student.find(params[:id])
        @currentStudentEntry = Entry.where(student_id: current_student.id)
        @studentEntry = Entry.where(student_id: @student.id)

        if @student.id == current_student.id #表示しているのが自分のページの場合
        else
            #表示している学生と自分のエントリに共通のroom_idがあるかどうか検索
            @currentStudentEntry.each do |cs|
                @studentEntry.each do |s|
                    if cs.room_id == s.room_id then
                        @isRoom = true
                        @roomId = cs.room_id
                    end
                end
            end
            #共通のRoomがなければ作る
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
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

    def search_id
        if params.permitted?
            params.require(:company).permit(:id)
        
        else
            1
        end
    end
end
