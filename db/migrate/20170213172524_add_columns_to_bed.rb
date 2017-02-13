class AddColumnsToBed < ActiveRecord::Migration[5.0]
  def change
    add_column :beds, :city, :string
    add_column :beds, :zipcode, :string
    add_column :beds, :country, :string
  end
end
