class BooksController < ApplicationController
  def index
    @book = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(prams[:id])
    @book = Book.new
    @user = User.find_by(id: @book.user.id)
    redirect_to books_url if @book.blank?
    # blank? railsの拡張。nil, "", " ", [], {} のいずれかでTrueを返す。
  end

  def edit
    @book = Book.firnd(params[:id])
    @user = @book.user
  end
end
