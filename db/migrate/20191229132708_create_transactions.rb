class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :sender
      t.references :recipient
      t.numeric :amount
      t.numeric :status
      t.timestamps
    end
  end
end
