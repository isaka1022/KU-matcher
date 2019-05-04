class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    from_student = Student.find_by(id: data['from_id'.to_s])
    to_company = Company.find_by(id: data['to_id'.to_s])
    from_student.send_message.find_by(to_user, data['room_id', data['content'])
  end
end
