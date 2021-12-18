class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.references :book, null: false, foreign_key: true
      t.refernces :author

      t.timestamps
    end
  end
end
