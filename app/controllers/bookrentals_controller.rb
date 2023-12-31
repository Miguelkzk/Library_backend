class BookrentalsController < ApplicationController
  before_action :set_rental, only: %i[show update destroy info_rental associate_copies]

  # mandar todo esto dentro del modelo book rental
  def create
    rental = BookRental.new(rental_params)
    if rental.save
      render json: rental
    else
      render json: rental.errors, status: :unprocessable_entity
    end
  end

  def index
    render json: BookRental.all
  end

  def show
    render json: @rental
  end

  def update
    if @rental.update(rental_params)
      render json: @rental
    else
      render json: rental.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @rental.destroy
      render json: @rental
    else
      render json: @rental.errors.details,  status: :unprocessable_entity
    end
  end

  def info_rental
    copy_info = @rental.book_copies.left_joins(:book).select('id_copy, title')
    client_info= @rental.client

    response_data = {
      info_book: copy_info,
      info_client: client_info
    }

    render json: response_data
  end

  private

  def set_rental
    @rental = BookRental.find(params[:id])
  end

  def rental_params
    params.require(:book_rental).permit(:rented_at, :rent_id, :expire_at, :client_id, :status_rented, book_copy_ids: [])
  end
end
