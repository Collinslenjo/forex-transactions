class AddCurrencyInputToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :input_currency, :string
    add_column :transactions, :output_currency, :string
  end
end
