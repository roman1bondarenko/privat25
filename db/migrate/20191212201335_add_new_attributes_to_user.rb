class AddNewAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer, default: 0
    add_column :users, :birthday, :date
    add_column :users, :is_deleted, :boolean
    add_column :users, :is_blocked, :boolean
  end
end
