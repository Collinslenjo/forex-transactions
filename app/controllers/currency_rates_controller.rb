class CurrencyRatesController < ApplicationController
  include CurrencyRateHelper

  def get_currency_rates
    currencies = CurrencyRate.all
    render json: currencies
  end

  def get_exchange_rate
    exchange_rate = fetch_rate(params[:currency_code])
    case exchange_rate
    when nil
      response = {:error => "Currency rate does not exist"}
    else
      response = exchange_rate
    end
    render json: response
  end
end
