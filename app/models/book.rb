class Book < ApplicationRecord
  has_many :book_copies
  validates :title, :author, presence: true
end
