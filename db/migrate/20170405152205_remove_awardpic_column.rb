class RemoveAwardpicColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :award_pic
  end
end
