class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user, foreign_key: true
      t.numeric :type
      t.numeric :amount
      t.numeric :percent
      t.datetime :close_at
      t.datetime :replenishment_at
      t.numeric :regular_replenishment_amount
      t.date :expired_bill_at
      t.numeric :early_closed_status
      t.numeric :amount_limit
      t.timestamps
    end
  end
end
