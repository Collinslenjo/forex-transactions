class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.string :reference
      t.float :input_amount
      t.float :output_amount
      t.datetime :transaction_date

      t.timestamps null: false
    end
  end
end
