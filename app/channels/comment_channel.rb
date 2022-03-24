class CommentChannel < ApplicationCable::Channel
  def subscribed
    @item = Item.find(params[:item_id])
    stream_for @item
    # stream_from "comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
