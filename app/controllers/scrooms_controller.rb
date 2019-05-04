class ScroomsController < ApplicationController
    def show
        @scroom = Scroom.find_by(params[:scroom_id]) #ルーム情報取得
        @scmessage = Scmessage.new #新規メッセージ投稿
        @scmessages = @scroom.scmessages #このルームのメッセージをすべて取得
        if student_signed_in?
            if @scroom.student.id == current_student.id
                @company = @scroom.company
            else
                redirect_to "/"
            end
        elsif company_signed_in?
            if @scroom.company.id == current_company.id
                @student = @scroom.student
            else
                redirect_to "/"
            end
        else
            redirect_to "/"
        end
    end

    def create
        if student_signed_in?
            @scroom = Scroom.new(scroom_params)
        elsif company_signed_in?
            @scroom = Scroom.new(scroom_student_params)
            @scroom.company_id  = current_company.id
        else
            redirect_to "/"
        end
        if @scroom.save
            redirect_to "/scrooms/#{@scroom.id}"
        else
            redirect_to "/"
        end
    end

    private
    def scroom_params
        params.require(:scroom).permit(:student_id, :company_id, :scroom_id)
    end
    def scroom_company_params
        params.require(:scroom).permit(:company_id)
    end

    def scroom_student_params
        params.require(:scroom).permit(:student_id)
    end
end
