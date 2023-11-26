class CreateBookCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :book_copies do |t|
      t.integer :id_copy
      t.integer :status
      t.integer :book_rental_id
      t.integer :book_id
      t.timestamps
    end
  end
end
