class AddIdsToAwards < ActiveRecord::Migration[5.0]
  def change
    add_column :hugos, :book_id, :integer
    add_column :hugos, :year_id, :integer
    add_column :hugos, :author_id, :integer
    add_column :nebulas, :book_id, :integer
    add_column :nebulas, :year_id, :integer
    add_column :nebulas, :author_id, :integer

  end
end
