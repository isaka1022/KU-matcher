class MessageBroadCastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_channel_#{message.room_id}", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationContoller.renderer.render(partial: 'messages/message', locals: {message: message})
end
