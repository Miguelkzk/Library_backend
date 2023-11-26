class BookCopy < ApplicationRecord
  belongs_to :book_rental, optional: true
  belongs_to :book
  enum status: {
    rented: 0,
    free: 1
  }
end
