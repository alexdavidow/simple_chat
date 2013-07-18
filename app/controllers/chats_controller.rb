class ChatsController < ApplicationController

  def index
  end

  def send_chat
    puts params

    data = {username: current_user.username, 
            avatar: current_user.image.thumb.url, 
            chat_text: params[:chat_input]}


    Pusher.trigger(params[:channel], 'message', data)
    render nothing: true
  end

end