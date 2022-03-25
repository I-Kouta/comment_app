class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment.save
      # @itemに紐づいた経路でJSにコメントと送信者のデータを送信
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
      # サーバーからクライアントへデータを送る
      ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
