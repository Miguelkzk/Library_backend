class BookRental < ApplicationRecord
  belongs_to :client, optional:true
  has_many :book_copy_rentals
  has_many :book_copies, through: :book_copy_rentals

  enum status_rented: {
    completed: 0,
    active: 1
  }

  after_update :check_bookcopy_status

  def check_bookcopy_status
    if status_rented == "completed"
      book_copies.update_all(status: :free)
    end
  end

  def change_bookcopy_status
    book_copies.each do |book_copy|
      book_copy.update(status: :rented)
    end
  end
end
