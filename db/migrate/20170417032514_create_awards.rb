class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :award_type
      t.timestamps
    end

    add_reference :books, :award, foreign_key: true

    remove_column :books, :year_id
    remove_column :books, :award

    create_table :books_authors, id: false do |t|
      t.integer :book_id
      t.integer :author_id
    end

    add_index :books_authors, :book_id
    add_index :books_authors, :author_id


    add_reference :awards, :year, foreign_key: true
  end
end
