class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.user_id = current_user.id
       @book.save
       flash[:notice] = "Book was successfully created"
       redirect_to user_path(current_user)
    else
       render :back
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