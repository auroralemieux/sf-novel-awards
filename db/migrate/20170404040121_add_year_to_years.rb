class AddYearToYears < ActiveRecord::Migration[5.0]
  def change
    add_column :years, :year, :integer
  end
end
