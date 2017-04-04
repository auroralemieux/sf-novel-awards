class AddAwardColumnToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :award, :string
    add_column :books, :award_pic, :string
  end
end
