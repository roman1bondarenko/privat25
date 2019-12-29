class CreateBillRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_requests do |t|
      t.references :manager, foreign_key: true
      t.references :bill, foreign_key: true
      t.datetime :approved_at
      t.numeric :approved_status
      t.text :message
      t.timestamps
    end
  end
end
