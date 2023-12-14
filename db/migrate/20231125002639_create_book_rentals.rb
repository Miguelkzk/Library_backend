class CreateBookRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :book_rentals do |t|
      t.datetime :rented_at
      t.datetime :expire_at
      t.integer :client_id
      t.integer :status_rented
      t.timestamps
    end
  end
end
