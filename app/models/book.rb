class Book < ApplicationRecord
  belongs_to :publisher

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> { where("name > ?", "%#(theme)%") }
end
