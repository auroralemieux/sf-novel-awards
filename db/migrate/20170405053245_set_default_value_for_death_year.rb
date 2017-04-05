class SetDefaultValueForDeathYear < ActiveRecord::Migration[5.0]
  def change
    change_column :authors, :death_year, :string, default: " "
    change_column :authors, :birth_year, :string

  end
end
