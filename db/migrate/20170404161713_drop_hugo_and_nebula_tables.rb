class DropHugoAndNebulaTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :nebulas
    drop_table :hugos 

  end
end
