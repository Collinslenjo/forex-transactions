class AddConversionRateToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :conversion_rates, :float
  end
end
