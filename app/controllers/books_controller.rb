class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@new_book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @new_book = Book.find(params[:id])
    if @new_book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @new_book = Book.find(params[:id])
    if @new_book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
