class MessagesController < ApplicationController
    def create
        if Entry.where(:student_id => current_student.id, :room_id => params[:message][:room_id]).present?
            @message = Message.create(params.require(:message).permit(:student_id, :content, :room_id).merge(:student_id => current_student.id))
            redirect_to "/rooms/#{@message.room_id}"
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
