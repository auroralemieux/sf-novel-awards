class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books_authors do |t|

      t.timestamps
    end
  end
end
