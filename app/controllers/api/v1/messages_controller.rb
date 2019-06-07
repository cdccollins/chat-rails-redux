class Api::V1::MessagesController < ApplicationController
  before_action :get_channel

  def index
    messages = Message.where(channel_id: @channel).to_a
    messages.each do |message|
      nickname = User.find(message.user_id).nickname
      message.author = nickname
    end
    render json: messages
  end

  def create
    message = Message.create(content: message_params["content"], user_id: current_user.id, channel_id: @channel.id, author: current_user.nickname)
    render json: message
  end

  private

  def get_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
