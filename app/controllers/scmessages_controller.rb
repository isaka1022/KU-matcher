class ScmessagesController < ApplicationController
    def create
        @scmessage = Scmessage.new(scmessage_params)
        if student_signed_in?
            @scmessage.is_student = true
        elsif company_signed_in?
            @scmessage.is_student = false
        end
        if @scmessage.save
            redirect_to "/scrooms/#{@scmessage.id}"
        else
            redirect_to "/scrooms/#{@scmessage.id}"
        end
    end
    private
    def scmessage_params
        params.require(:scmessage).permit(:scroom_id,:content)
    end
end
