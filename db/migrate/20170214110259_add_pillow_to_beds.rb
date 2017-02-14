class AddPillowToBeds < ActiveRecord::Migration[5.0]
  def change
    add_column :beds, :pillow, :boolean
  end
end
