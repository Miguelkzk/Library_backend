class CreateBookCopiesRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :book_copies_rentals do |t|
      t.belongs_to :book_copy
      t.belongs_to :book_rental

      t.timestamps
    end
  end
end
