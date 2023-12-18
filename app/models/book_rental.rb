class BookRental < ApplicationRecord
  belongs_to :client, optional:true
  has_and_belongs_to_many :book_copies
  validates :book_copies, presence: true
  validate :check_book_copies_status, on: :create
  enum status_rented: {
    completed: 0,
    active: 1
  }
  after_initialize :initialize_status

  def check_book_copies_status
    ids = BookCopy.where(id: book_copy_ids).joins(:book_rentals)
                  .where(book_rentals: { status_rented: :active }).pluck(:id)

    errors.add(:base, 'Rented book found', ids:) if ids.any?
  end

  def initialize_status
    self.status_rented ||= :active
  end
end
