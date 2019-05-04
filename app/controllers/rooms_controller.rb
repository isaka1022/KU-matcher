class RoomsController < ApplicationController
    def create 
        @room = Room.create #新規Roomテーブルを作成
        @entry1 = Entry.create(:room_id => @room.id, :student_id => current_student.id) #新規Entryを作成
        @entry2 = Entry.create(params.require(:entry).permit(:student_id, :room_id).merge(:room_id => @room.id))
        redirect_to "/rooms/#{@room.id}"
    end

    def show
        @room = Room.find(params[:id])
        if Entry.where(:student_id => current_student.id, :room_id => @room.id).present?
            @messages = @room.messages
            @message = Message.new
            @entries = @room.entries
        else
            redirect_back(fallback_locaktion: root_path)
        end
    end
end
