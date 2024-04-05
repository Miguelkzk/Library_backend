class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy show_copies]

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

  def show_copies
    response_data = {
      book_copies: @book.book_copies.map do |book_copy|
        status = book_copy.book_rentals.any? { |rental| rental.status_rented == 'active' } ? 'rented' : 'free'
        {
          id: book_copy.id,
          id_copy: book_copy.id_copy,
          status: status
        }
      end
    }
    render json: response_data
  end

  def search_books
    title = params[:title]
    author = params[:author]
    query=Book.all
    query = query.where("title LIKE ?", "%#{title}%") if title.present?
    query = query.where("author LIKE ?", "%#{author}%") if author.present?
    results = query.all

    # Devolver resultados
    render json: results
  end
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :price_per_day)
  end
end