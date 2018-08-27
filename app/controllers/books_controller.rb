class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create!(book_params)
    render 'show'
  end

  def update
    @book = Book.find(params[:id])
    @book.update!(book_params)
    render 'show'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    render 'show'
  end

  private
  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :isbn,
    )
  end
end
