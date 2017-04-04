class AddYearIdToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :year_id, :integer
  end
end
