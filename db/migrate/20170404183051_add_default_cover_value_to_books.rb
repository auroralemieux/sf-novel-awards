class AddDefaultCoverValueToBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :cover, :string, default: "http://www.codigarysbooks.com/uploads/1/9/0/6/19065263/7887743_orig.jpg"
  end
end
