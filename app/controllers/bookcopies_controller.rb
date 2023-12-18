class BookcopiesController < ApplicationController
  before_action :set_copy, only: %i[show update destroy]
  def create
    copy = BookCopy.new(copy_params)
    if copy.save
      render json: copy
    else
      render json: copy.errors, status: :unprocessable_entity
    end
  end

  def index
    render json: BookCopy.all
  end

  def show
    render json: @copy
  end

  def update
    if @copy.update(copy_params)
      render json: @copy
    else
      render json: copy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @copy.destroy
  end

  private

  def set_copy
    @copy = BookCopy.find(params[:id])
  end

  def copy_params
    params.permit(:id_copy, :status, :book_rental_id, :book_id)
  end
end
