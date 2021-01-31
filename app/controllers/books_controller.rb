class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      @book.user_id = current_user.id
      flash[:notice] = "Book was successfully created"
      redirect_to user_path(current_user)
    else
      render('users/index')
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       flash[:notice] = "Book was successfully deleted"
       redirect_to user_path(current_user)
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
