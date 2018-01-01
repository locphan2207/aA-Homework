class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    new_book = Book.new(book_params)
    if new_book.save
     redirect_to books_url
    else
     flash.now[:errors] = book.errors.full_messages
     render :new
    end
  end

  def destroy
    del_book = Book.find(params[:id])
    del_book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
