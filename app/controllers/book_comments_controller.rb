class BookCommentsController < ApplicationController
  def create
    book = Book.finda(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
  end

  def destroy
  end
end
# controllerからviewへの情報の受け渡しはなくviewでコメントを記述してcontroller内で
    # 保存管理を行いcontrollerからviewの受け渡しは、必要ない為、インスタンス変数を
    # 使う必要がなくローカル変数での記述である