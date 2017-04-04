class AddPicsToAwards < ActiveRecord::Migration[5.0]
  def change

    add_column :nebulas, :pic, :string
    add_column :hugos, :pic, :string

  end
end
