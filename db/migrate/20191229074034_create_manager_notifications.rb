class CreateManagerNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_notifications do |t|
      t.references :manager, foreign_key: true
      t.references :bill, foreign_key: true
      t.text :message
      t.timestamps
    end
  end
end
