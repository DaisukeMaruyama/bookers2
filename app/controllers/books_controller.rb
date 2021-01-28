class BooksController < ApplicationController

  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:notice] = "your book is successfully created"
      redirect_to user_path(current_user)
    else
      render('users/index')
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       flash[:notice] = "your book is successfully deleted"
       redirect_to user_path(current_user)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
