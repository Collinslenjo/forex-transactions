class Transaction < ActiveRecord::Base

  validates :customer_id, presence: true
  validates :reference, presence: true
  validates :input_amount, presence: true, numericality: {:greater_than => 0, :message => "input_amount is wrong."}
  validates :output_amount, presence: true
  validates :transaction_date, presence: true
  validates :input_currency, presence: true
  validates :output_currency, presence: true
  validates :conversion_rates, presence: true

end
