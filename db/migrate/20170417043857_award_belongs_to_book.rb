class AwardBelongsToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :awards, :book, foreign_key: true
    remove_column :books, :award_id
  end
end
