Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'orders', to: 'orders#create'
  get '/orders/gets/:id', to: 'orders#gets'
end
