class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def create
    if book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      @book = book
      @books = Book.all
      render :index
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

   private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
