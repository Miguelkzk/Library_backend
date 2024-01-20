class Client < ApplicationRecord
  has_many :book_rentals
  validates :name, :lastname, :card_id, :phone, presence: true
  validates :email, presence: true, format: { with: /\A\S+@\S+\z/ }
end
