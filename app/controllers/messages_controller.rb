class MessagesController < ApplicationController


  def create
    @message = Message.new(message_params)
    @message.user = message_author
    Response.find(params[:message][:response_id]).messages << @message
    @message.save
    redirect_to message_path(@message.response.post)
  end


  private

  def message_author
    !current_user.nil?
  end

  def message_params
    params.require(:message).permit(:comment)
  end

end
