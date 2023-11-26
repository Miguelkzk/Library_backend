class BookRental < ApplicationRecord
  belongs_to :client
  has_many :book_copies
end
