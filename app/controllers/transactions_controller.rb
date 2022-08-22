class TransactionsController < ApplicationController
  require 'securerandom'
  require 'date'
  include CurrencyRateHelper

  def index
      transactions = Transaction.all
      render json: transactions
  end

  def create
    input_currency = params[:input_currency]
    output_currency = params[:output_currency]
    input_amount = params[:input_amount]
    customer_id = params[:customer_id]

    begin
      customer = Customer.find(customer_id)
    rescue ActiveRecord::RecordNotFound
      customer = Customer.find(1) # Assign to default customer
    end

    conversion_rate = 0
    exchange_rate = fetch_rate(output_currency)
    if exchange_rate
      if exchange_rate.conversion_rate == nil
        print("output currency does not have an exchange_rate} \n")
      else
        conversion_rate = exchange_rate.conversion_rate
      end
    end
    print("conversion_rate: #{conversion_rate} \n")
    output_amount = input_amount * conversion_rate

    transaction = Transaction.create(
        customer_id: customer.id,
        reference: SecureRandom.uuid,
        input_amount: input_amount,
        output_amount: output_amount,
        transaction_date: DateTime.now,
        input_currency: input_currency,
        output_currency: output_currency,
        conversion_rates: conversion_rate)

    render json: transaction
  end

  def show
    begin
      transaction = Transaction.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      transaction = {:error => "Transaction does not exist"}
    end
    render json: transaction
  end
end
