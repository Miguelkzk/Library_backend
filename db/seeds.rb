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
# Libro 2
book2 = Book.create!(title: 'Introducción a la Programación', author: 'John Doe', price_per_day: 150)
book2.book_copies.create!([{ id_copy: 4 }, { id_copy: 5 }, { id_copy: 6 }])

# Libro 3
book3 = Book.create!(title: 'Historia del Arte', author: 'Maria Rodriguez', price_per_day: 180)
book3.book_copies.create!([{ id_copy: 7 }, { id_copy: 8 }, { id_copy: 9 }])

# Añadir más libros según sea necesario...

# Libro 4
book4 = Book.create!(title: 'Ruby on Rails: Guía Completa', author: 'David Smith', price_per_day: 220)
book4.book_copies.create!([{ id_copy: 10 }, { id_copy: 11 }, { id_copy: 12 }])

# Libro 5
book5 = Book.create!(title: 'Machine Learning Essentials', author: 'Emily White', price_per_day: 250)
book5.book_copies.create!([{ id_copy: 13 }, { id_copy: 14 }, { id_copy: 15 }])

# Libro 6
book6 = Book.create!(title: 'Ciencia de Datos para Principiantes', author: 'Carlos Gomez', price_per_day: 180)
book6.book_copies.create!([{ id_copy: 16 }, { id_copy: 17 }, { id_copy: 18 }])

# Libro 7
book7 = Book.create!(title: 'Filosofía Moderna', author: 'Laura Johnson', price_per_day: 160)
book7.book_copies.create!([{ id_copy: 19 }, { id_copy: 20 }, { id_copy: 21 }])

# Libro 8
book8 = Book.create!(title: 'Economía Globalizada', author: 'Robert Brown', price_per_day: 190)
book8.book_copies.create!([{ id_copy: 22 }, { id_copy: 23 }, { id_copy: 24 }])

# Libro 9
book9 = Book.create!(title: 'Diseño Web Responsivo', author: 'Anna Clark', price_per_day: 210)
book9.book_copies.create!([{ id_copy: 25 }, { id_copy: 26 }, { id_copy: 27 }])

# Libro 10
book10 = Book.create!(title: 'Literatura Clásica', author: 'Michael Johnson', price_per_day: 170)
book10.book_copies.create!([{ id_copy: 28 }, { id_copy: 29 }, { id_copy: 30 }])