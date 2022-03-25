// クライアントの画面に描写するためのファイル
import consumer from "./consumer"

if(location.pathname.match(/\/items\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    item_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // 変数に代入,dataからキー名を指定してコメントと送信者の情報を取出
      const html = `
        <div class="comment">
          <p class="user-info">${data.user.nickname}： </p>
          <p>${data.comment.text}</p>
        </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      // フォームの中身をリセット
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  })
}