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
    free=0
    rented=0
    book_copies_data = @book.book_copies
                            .left_joins(:book_rentals)
                            .select('book_copies.*, book_rentals.status_rented AS copy_status')
                            .to_a
    book_copies_data.each do |element|
      element['copy_status'] ||= 'free'
        if element['copy_status'] == 1
          element['copy_status'] = 'Rented'
          rented += 1
       else
          element['copy_status'] = 'Free'
          free += 1
       end
    end

    response_data = {
      book_copies: book_copies_data,
      free: free,
      rented: rented
    }
    render json: response_data
  end
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :author, :price_per_day)
  end
end