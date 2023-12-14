class BookCopyRental < ApplicationRecord
  belongs_to :book_copy
  belongs_to :book_rental
end
