class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> { where("name > ?", "%#(theme)%") }
end
