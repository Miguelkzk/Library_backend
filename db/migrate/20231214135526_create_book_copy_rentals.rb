class CreateBookCopyRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :book_copy_rentals do |t|
      t.references :book_copy, null: true, foreign_key: true
      t.references :book_rental, null: true, foreign_key: true

      t.timestamps
    end
  end
end
