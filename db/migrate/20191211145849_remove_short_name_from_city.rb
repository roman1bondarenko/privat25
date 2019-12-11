class RemoveShortNameFromCity < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :short_name
  end
end
