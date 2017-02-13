class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :gender_preferences, :string
    add_column :users, :description, :text
    add_column :users, :photo, :string
  end
end
