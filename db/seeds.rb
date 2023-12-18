# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

book = Book.create!(title: 'Cálculo Multivariable', author: 'James Stewart', price_per_day: 200)
book_copies = book.book_copies.create!([{ id_copy: 10 }, { id_copy: 11 }, { id_copy: 12 }])
client= Client.create!(name: 'Beto', lastname: 'alberto')
rental=BookRental.create!(rented_at: Time.now.yesterday,
                          expire_at: Time.now.tomorrow, client:, book_copies:, status_rented: :active)
