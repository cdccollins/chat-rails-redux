class ChatChannel < ApplicationCable::Channel
  def subscribed
    messages = Messages.find(params[:channel])
    stream_for messages
  end
end
