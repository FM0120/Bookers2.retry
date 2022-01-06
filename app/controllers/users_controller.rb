class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = @user.book
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @book = current_user.books
    # unless @user == current_user
    #   redirect_to user_path(current_user.id)
    # end
  end
end

def create
  @user = User.new(params[:id])
  @user.user.id = current_user.user.id
  @user.save
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  else
    render:edit
  end
end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end