class BookCopy < ApplicationRecord
  belongs_to :book
  has_and_belongs_to_many :book_rentals
end
