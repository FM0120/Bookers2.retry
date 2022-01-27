class BooksController < ApplicationController
  def index
    @books = Book.all
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
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end
  
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
