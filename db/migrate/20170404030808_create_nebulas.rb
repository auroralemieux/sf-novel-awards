class CreateNebulas < ActiveRecord::Migration[5.0]
  def change
    create_table :nebulas do |t|
      t.timestamps
    end
  end
end
