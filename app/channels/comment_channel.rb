# チャネルを設定。クライアントとサーバーを結びつける
class CommentChannel < ApplicationCable::Channel
  def subscribed
    @item = Item.find(params[:item_id])
    # @itemに関連したデータの経路を指定
    stream_for @item
    # stream_from "comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
