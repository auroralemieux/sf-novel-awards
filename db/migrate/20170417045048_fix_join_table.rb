class FixJoinTable < ActiveRecord::Migration[5.0]
  def change

    drop_table :books_authors

    create_table :authors_books, id: false do |t|
      t.integer :book_id
      t.integer :author_id
    end

    add_index :authors_books, :book_id
    add_index :authors_books, :author_id
  end
end
