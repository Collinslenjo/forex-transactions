module CurrencyRateHelper
  def fetch_rate(currency_code)
      begin
        exchange_rate = CurrencyRate.find_by(currency_code: currency_code)
      rescue ActiveRecord::RecordNotFound
        exchange_rate = nil
      end
      return exchange_rate
  end
end
