class BookCopy < ApplicationRecord
  belongs_to :book
  has_many :book_copy_rentals
  has_many :book_rentals, through: :book_copy_rentals
  enum status: {
    rented: 0,
    free: 1
  }
  def can_be_associated_to_rental?
    status == 'free'
  end
end
