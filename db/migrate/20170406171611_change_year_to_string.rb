class ChangeYearToString < ActiveRecord::Migration[5.0]
  def change
    change_column :years, :year, :string
  end
end
