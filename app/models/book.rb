class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> { where("name > ?", "%#(theme)%") }
end
