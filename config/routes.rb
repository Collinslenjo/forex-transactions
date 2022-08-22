Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'transactions#index'

  resources :transactions, only: [:index, :create, :show]
  get 'currency/all' => 'currency_rates#get_currency_rates'
  post 'currency/convert' => 'currency_rates#get_exchange_rate'

end
