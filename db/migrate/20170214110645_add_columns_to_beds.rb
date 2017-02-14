class AddColumnsToBeds < ActiveRecord::Migration[5.0]
  def change
    add_column :beds, :blanket_type, :string
    add_column :beds, :breakfast, :boolean
  end
end
