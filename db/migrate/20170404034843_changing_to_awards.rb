class ChangingToAwards < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :year

  end
end
