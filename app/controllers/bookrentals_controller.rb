class BookrentalsController < ApplicationController
  before_action :set_rental, only: %i[show update destroy book_copies associate_copies]

  def create
    rental = BookRental.new(rental_params)
    if rental.save
      render json: rental
    else
      render json: rental.errors, status: :unprocessable_entity
    end
  end

  def index
    @rental = BookRental.all
    render json: @rental
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
    @rental.destroy
  end

  def book_copies
    render json: @rental.book_copies
  end

  def associate_copies
    book_copies_data = params[:book_copies]
    errors = []
    book_copies_data.each do |copy_data|
      book_copy = BookCopy.find(copy_data["id"])
      if book_copy.can_be_associated_to_rental?
        @rental.book_copies << book_copy
      else
        errors << "Error, la copia de libro con ID #{book_copy['id_copy']} ya se encuentra rentada"
      end
    end

    if errors.empty?
      if @rental.save
        @rental.change_bookcopy_status
        render json: @rental
      else
        render json: @rental.errors, status: :unprocessable_entity
      end
    else
      render json: { errors: errors }, status: :unprocessable_entity
    end
  end

  private

  def set_rental
    @rental = BookRental.find(params[:id])
  end

  def rental_params
    params.permit(:rented_at, :expire_at, :client_id, :status_rented, :book_copies)
  end
end