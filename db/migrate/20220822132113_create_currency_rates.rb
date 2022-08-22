class CreateCurrencyRates < ActiveRecord::Migration
  def change
    create_table :currency_rates do |t|
      t.string :currency_code
      t.float :conversion_rate

      t.timestamps null: false
    end
  end
end
