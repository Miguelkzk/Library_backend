class BooksController < ApplicationController 
  before_action :set_book, only: %i[show update destroy]

  def index
    render json: Book.all
  end

  def show
    render json: @book
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book
    else
      render json: book.errors.details, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      render json: @book
    else
      render json: @book.errors.details, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :price_per_day)
  end
end
