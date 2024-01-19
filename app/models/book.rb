class Book < ApplicationRecord
  has_many :book_copies
  validates :title, :author, :price_per_day, presence: true
end
