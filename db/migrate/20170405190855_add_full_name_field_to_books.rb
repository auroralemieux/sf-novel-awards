class AddFullNameFieldToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :full_name, :string, default: "#{:first_name} #{:last_name}"
  end
end
