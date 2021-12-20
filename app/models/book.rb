class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exersise."
    end
  end
  #gsupは文字列の置き換え
  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  before_validation :add_lovely_to_cat
=begin
  Cat→lovely Catにするコールバックのもう一つの書き方
  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
=end

  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> { where("name like ?", "%#{theme}%") }
end
